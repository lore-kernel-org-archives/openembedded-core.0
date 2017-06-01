Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D824877D2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 17:11:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v51HBL4D015256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Jun 2017 10:11:21 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:11:20 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <af1710db-aa6a-1934-e2e8-d59f94c52402@windriver.com>
Date: Thu, 1 Jun 2017 12:11:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <dc21b6be8d46f824831ff9bf4a5055dec3895b6b.1496329361.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 1/2] package_rpm.bbclass: use multithreaded xz compression
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
X-List-Received-Date: Thu, 01 Jun 2017 17:11:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/1/17 10:15 AM, Alexander Kanavin wrote:
> RPM's default is single-threaded gz; the change greatly helps with
> both buildtimes (when there is a small number of large-sized packages)
> and disk space taken by resulting rpms.

If you wnable XZ here, you need to make sure XZ compression is enabled within
rpm itself.  (I know how that worked in rpm5, not sure how rpm4 does it -- it
may be enable that the binary be present to call out to.)

Similarly to XZ, you can use pigz or other parallel compression tools to do
similar with other schemes.

Finally I have not investigated parallel XZ, but in some cases the resulting
compressed file is different depending on compression artifacts due to
parallelization.  (The compressed file is different, not the uncompressed content.)

This can be a concern to some who want fully reproducible builds (from source).
So we need to make sure we have a way to disable this type of parallelization
--if-- it causes a problem with different contents.

(Note the fact RPM package metadata changes each time a new RPM is constructed,
this is far -less- of a concern to me.. but something to be aware of.)

--Mark

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index a844c4d4360..dc241975c3b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -644,6 +644,8 @@ python do_package_rpm () {
>      cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
>      cmd = cmd + " --define '_use_internal_dependency_generator 0'"
>      cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
> +    cmd = cmd + " --define '_binary_payload w6T.xzdio'"
> +    cmd = cmd + " --define '_source_payload w6T.xzdio'"
>      if perfiledeps:
>          cmd = cmd + " --define '__find_requires " + outdepends + "'"
>          cmd = cmd + " --define '__find_provides " + outprovides + "'"
> 


