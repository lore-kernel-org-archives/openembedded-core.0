Return-Path: <jpewhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Joshua Watt" <JPEWhacker@gmail.com>
Subject: Re: [WIP/RFC] create-spdx: Get SPDX-License-Identifier from source
References: <20220128220305.29675-1-saul.wold@windriver.com>
Message-ID: <1707806e-1901-c202-176c-a1ffa6527fdd@gmail.com>
Date: Fri, 28 Jan 2022 16:44:50 -0600
MIME-Version: 1.0
In-Reply-To: <20220128220305.29675-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: Saul Wold <saul.wold@windriver.com>, openembedded-core@lists.openembedded.org


On 1/28/22 4:03 PM, Saul Wold wrote:
> This patch will read the begining of source files and try to find
> the SPDX-License-Identifier to populate the licenseInfoInFiles
> field for each source file. This does not populate licenseConculed
> at this time, nor rolls it up to package level.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   classes/create-spdx.bbclass | 25 +++++++++++++++++++++++++
>   lib/oe/spdx.py              |  2 +-
>   2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/classes/create-spdx.bbclass b/classes/create-spdx.bbclass
> index 180d667..9c11945 100644
> --- a/classes/create-spdx.bbclass
> +++ b/classes/create-spdx.bbclass
> @@ -30,6 +30,21 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
>   
>   do_image_complete[depends] = "virtual/kernel:do_create_spdx"
>   
> +def extract_licenses(filename):
> +    import re
> +    lic_regex = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
> +
> +    try:
> +        with open(filename, 'r') as f:
> +            size = min(15000, os.stat(filename).st_size)
> +            txt = f.read(size)
> +            licenses = re.findall(lic_regex, txt)
> +            if licenses:
> +                return licenses
> +    except Exception as e:
> +        bb.warn(f"Exception on {filename}: {e}")
> +        return None
> +
>   def get_doc_namespace(d, doc):
>       import uuid
>       namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
> @@ -232,6 +247,16 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
>                           checksumValue=bb.utils.sha256_file(filepath),
>                       ))
>   
> +                if "SOURCES" in spdx_file.fileTypes:
> +                    licenses = extract_licenses(filepath)
> +                    if licenses is not None:
> +                        for lic in licenses:
> +                            spdx_file.licenseInfoInFiles.append(lic.strip())
> +                    else:
> +                        spdx_file.licenseInfoInFiles.append("NOASSERTATION")

"NOASSERTION"


> +                else:
> +                    spdx_file.licenseInfoInFiles.append("NOASSERTATION")

"NOASSERTION"

> +
>                   doc.files.append(spdx_file)
>                   doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
>                   spdx_pkg.hasFiles.append(spdx_file.SPDXID)
> diff --git a/lib/oe/spdx.py b/lib/oe/spdx.py
> index 9e7ced5..71e7c1c 100644
> --- a/lib/oe/spdx.py
> +++ b/lib/oe/spdx.py
> @@ -236,7 +236,7 @@ class SPDXFile(SPDXObject):
>       fileName = _String()
>       licenseConcluded = _String(default="NOASSERTION")
>       copyrightText = _String(default="NOASSERTION")
> -    licenseInfoInFiles = _StringList(default=["NOASSERTION"])
> +    licenseInfoInFiles = _StringList()

It's required to have "NOASSERTION" as the default if you don't do 
anything, so we shouldn't change the default here (by and large, this 
file should capture the spec over our use of it).

It's on my TODO list to make the "default" lists behave like default 
scalars, where appending replaces the default instead of appending to 
it, but I haven't gotten there yet; it hasn't come up as a problem before.


Probably need to do something like:


  license_info_from_file = []
  # scan files here
  if license_info_from_files:

     spdx_file.licenseInfoInFiles = license_info_from_files


>       checksums = _ObjectList(SPDXChecksum)
>       fileTypes = _StringList()
>   
