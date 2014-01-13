Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f50.google.com (mail-qe0-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id AF5596B5FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 17:02:46 +0000 (UTC)
Received: by mail-qe0-f50.google.com with SMTP id 1so7351639qec.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 09:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=36vpVI8Mbsui3R3WsuISVh/UTtiS5799b4t764EbZV0=;
	b=IKaYN5hW+zLLlxq2NyIKDFraPnDPEdCNO3MD4QMLTa9tdq6whbmYNxv4FDPTtNgQIU
	nynQ1e+dvc2GJ+VgGrgrZ8xbkf5PIwzPofvnDGUl4hk3CXH+0Eu8YWdVeuP+JQUnbAfQ
	aC6xd6EZgYRuR3XUUhGZe779zfRvHKCVUoT4Sq2n+i/zJhTDwUHqo1HZ2CvRWx0w/s6N
	kImhGGfd5KuWyYewB+1HruzGgjAUzLluChq+OYKeRnAbP9sQ5h502sQ1dTW/K2Y5YbBo
	avzcDYCnJvML+LJOK1wGmHAS4hCJzA2DPvws+K9Bg6RsYkeYpAhJED/yRtNctXnD5p76
	7pYA==
X-Gm-Message-State: ALoCoQmPrPCkNiastzXlWABSEMox0CfbM2x5ssbi9aYinPvJKVFlV6uH0oz4bXKQ9UCcm5kbRyT+
X-Received: by 10.229.14.1 with SMTP id e1mr28747613qca.15.1389632567059; Mon,
	13 Jan 2014 09:02:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 13 Jan 2014 09:02:26 -0800 (PST)
In-Reply-To: <66484b0f9b20980f5e45f01aba5eeec8c24a974f.1389338076.git.anders@chargestorm.se>
References: <cover.1389338076.git.anders@chargestorm.se>
	<66484b0f9b20980f5e45f01aba5eeec8c24a974f.1389338076.git.anders@chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Jan 2014 17:02:26 +0000
Message-ID: <CAJTo0LZ8ndPW0wFDdFip3a8y=qxqaY9vFO4i8d1AA4YYVNAccA@mail.gmail.com>
To: Anders Darander <anders@chargestorm.se>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd-compat-units: do not mask available services
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
X-List-Received-Date: Mon, 13 Jan 2014 17:02:46 -0000
Content-Type: text/plain; charset=UTF-8

If dnsmasq doesn't need to be manually masked, then why not just
remove it from the list?

Ross

On 10 January 2014 07:15, Anders Darander <anders@chargestorm.se> wrote:
> Do also check systemd_unitdir/system/ for available unit files.
>
> This was hiding dnsmasq.service for us, as /etc/systemd/system has
> priority over systemd_unitdir/system...
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> index 9f28283..e32ad79 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -42,7 +42,7 @@ pkg_postinst_${PN} () {
>         fi
>
>         for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
> -               if [ \( -e $i -o $i.sh \) -a ! -e $D${sysconfdir}/systemd/system/$i.service ] ; then
> +               if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/$i.service -o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
>                         echo -n "$i: " ; systemctl ${OPTS} mask $i.service
>                 fi
>         done ; echo
> --
> 1.8.5.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

