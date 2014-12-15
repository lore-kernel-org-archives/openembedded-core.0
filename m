Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9607253E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 20:37:30 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so12362223pdi.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 12:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=NijK0YcqnreiZVZc3IfAs57tcUP/GQf1RW0fagMNWoE=;
	b=sxonX9I2FB+C/efNXvb68B4qQimnCVWILWIJjnLoUsIZbyxUBTzOlSExb/ehYRQjVl
	SmW0wqzK3z50TKptWLg8ONAwtBLEdnRjAL/s5H6ycjvHQfObZorCJhRMfjBKMMyhSGu1
	8UjPfkNWpNeo1H+8PVzZNWhVNa3mYhpN2EFVx9DeDUW9jkYlxzI2WZdg2F6mmuToEWWd
	YImWNYChPwB5h3ayUsaX98QKop391HgxlFQ3ABOQ58T1dJkHZRkdpFy711XAdqCMpz/A
	qtGC8WsmvhbDxijQ6G/Hi+SFJAWrBjzNxEYn4yaGivQArQfX9gGrr7ewOVf8KMjzQhWT
	bluQ==
X-Received: by 10.70.128.132 with SMTP id no4mr54300197pdb.125.1418675851345; 
	Mon, 15 Dec 2014 12:37:31 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:24f9:2e5e:eee1:ad88?
	([2601:c:9380:601:24f9:2e5e:eee1:ad88])
	by mx.google.com with ESMTPSA id
	gx5sm10030613pbb.96.2014.12.15.12.37.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Dec 2014 12:37:30 -0800 (PST)
Message-ID: <548F4684.9000401@gmail.com>
Date: Mon, 15 Dec 2014 12:37:24 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1418671309-23451-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1418671309-23451-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] openssh: move setting LD to allow for correct override
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
X-List-Received-Date: Mon, 15 Dec 2014 20:37:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Saul,

is this needed for dizzy too?

- Armin

On 12/15/2014 11:21 AM, Saul Wold wrote:
> Using the export LD in the recipe does not allow for secodnary toolchain
> overriding LD later, by setting it in the do_configure_append the export
> is used by autotools setting LD based on the env, but would allow for
> override later.
>
> [YOCTO #6997]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-connectivity/openssh/openssh_6.6p1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
> index dbcf414..abc302b 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
> @@ -49,7 +49,6 @@ inherit autotools-brokensep ptest
>
>   # LFS support:
>   CFLAGS += "-D__FILE_OFFSET_BITS=64"
> -export LD = "${CC}"
>
>   # login path is hardcoded in sshd
>   EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
> @@ -74,6 +73,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
>   EXTRA_OECONF_append_libc-uclibc=" --without-pam"
>
>   do_configure_prepend () {
> +	export LD="${CC}"
>   	install -m 0644 ${WORKDIR}/sshd_config ${B}/
>   	install -m 0644 ${WORKDIR}/ssh_config ${B}/
>   	if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
>

