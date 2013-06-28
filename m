Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E99BF61A45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 19:05:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5SJ5ho0005797
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:05:43 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 12:05:42 -0700
Message-ID: <51CDDE85.8040801@windriver.com>
Date: Fri, 28 Jun 2013 14:05:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1372445217-28739-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1372445217-28739-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] security_flags: Add the compiler and linker flags that enhance security
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
X-List-Received-Date: Fri, 28 Jun 2013 19:05:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/13 1:46 PM, Saul Wold wrote:
> These flags add addition checks at compile, link and runtime to prevent
> stack smashing, checking for buffer overflows, and link at program start
> to prevent call spoofing later.
>
> This needs to be explicitly enabled by adding the following line to your
> local.conf:
>
> require conf/distro/include/security_flags.inc
>
> [YOCTO #3868]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/conf/distro/include/security_flags.inc | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 meta/conf/distro/include/security_flags.inc
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> new file mode 100644
> index 0000000..dc231e2
> --- /dev/null
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -0,0 +1,21 @@
> +SECURITY_CFLAGS = "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
> +SECURITY_LDFLAGS = "-Wl,-z,relro,-z,now"

Where do the flags get introduced into the actual CFLAGS and LDFLAGS?  Would it 
make sense to add this to the existing BUILD_OPTIMIZATION settings..  So they 
would always be available, and someone could just flip a switch to enable it?

> +
> +#TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
> +SECURITY_CFLAGS_pn-ppp = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-eglibc = ""
> +SECURITY_CFLAGS_pn-eglibc-initial = ""

I know why you don't use them on -initial, but any reason to not enable this on 
'eglibc'?  If it doesn't work, it would be good to enhance eglibc's recipe to 
spit out a warning and sanitize the build like it does for -O0.

--Mark

> +SECURITY_CFLAGS_pn-zlib = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-gcc-runtime = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-libgcc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-tcl = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-libcap = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-python-smartpm = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-python-imaging = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-python-pycurl = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-kexec-tools = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +
> +# These flags seem to
> +SECURITY_CFLAGS_pn-pulseaudio = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
> +SECURITY_CFLAGS_pn-ltp = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
>


