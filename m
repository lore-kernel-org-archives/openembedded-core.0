Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E09C77046
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:41:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2015 06:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="583777547"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.253])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2015 06:41:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Mon, 19 Oct 2015 14:41:09 +0100
Message-ID: <722633449.5WlMM4sgsE@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1c795f9672bcf9ffe43d311177019f10ce997d3a.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1c795f9672bcf9ffe43d311177019f10ce997d3a.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oeqa/utils/ftools: Checks before appending/reading files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Oct 2015 13:41:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leo,

On Monday 19 October 2015 05:24:44 leonardo.sandoval.gonzalez@linux.intel.com 
wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Before trying to append/read a file, check if file exists.
> 
> Signed-off-by: Leonardo Sandoval
> <leonardo.sandoval.gonzalez@linux.intel.com> ---
>  meta/lib/oeqa/utils/ftools.py | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
> index 64ebe3d..70a55b8 100644
> --- a/meta/lib/oeqa/utils/ftools.py
> +++ b/meta/lib/oeqa/utils/ftools.py
> @@ -8,20 +8,24 @@ def write_file(path, data):
> 
>  def append_file(path, data):
>      wdata = data.rstrip() + "\n"
> -    with open(path, "a") as f:
> +    if os.path.isfile(path):
> +        with open(path, "a") as f:
>              f.write(wdata)

Hang on - opening a nonexistent file with mode 'a' is perfectly fine, it'll just 
get created - why do we need this check?


>  def read_file(path):
>      data = None
> -    with open(path) as f:
> -        data = f.read()
> +    if os.path.isfile(path):
> +        with open(path) as f:
> +            data = f.read()
>      return data
> 
>  def remove_from_file(path, data):
> -    lines = read_file(path).splitlines()
> -    rmdata = data.strip().splitlines()
> -    for l in rmdata:
> -        for c in range(0, lines.count(l)):
> -            i = lines.index(l)
> -            del(lines[i])
> -    write_file(path, "\n".join(lines))
> +    rawdata = read_file(path)
> +    if rawdata:
> +        lines = rawdata.splitlines()
> +        rmdata = data.strip().splitlines()
> +        for l in rmdata:
> +            for c in range(0, lines.count(l)):
> +                i = lines.index(l)
> +                del(lines[i])
> +        write_file(path, "\n".join(lines))

Checking a file exists before opening it isn't good practice. It's much better 
to try opening it and if the open fails with IOError of errno.ENOENT then 
ignore it (or rather, if e.errno  != errno.ENOENT then re-raise the 
exception).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

