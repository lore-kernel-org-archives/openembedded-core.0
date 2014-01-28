Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7909B6EA3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 23:12:17 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id ar20so1271395iec.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 15:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gErFD0AeRzKkSMQ9x2+SC6wvjL0Gp3lYFlREdiTSYJ0=;
	b=l0eTeYum00Lz43/tMULlp2LMJajhwE2gW7CJ+qqusKbSJr2tDAWdF+HGZEv498aUeA
	fu4eAB8WgJnpS/S7c7UCI1XZRQJtWeyZXglpPiCLNFXUAHXnZDgIwm8kvsjPXXzsVSpE
	R2mhcPpFHdcQf9QIGR8py2isYzkPUjqlEPKakYhqFEOXTD4ZA8UoxvaQeoiZXADyEq0d
	h+aPhs+X+dBFgjhiSoW5Z1//e6Ew0QfMWvotgjGta6f3PV1q6fr53SDSzkUtuhak/TjS
	mqJdBBK2YB/W3CU11UC2NKRwEUo2zdiuYrkVx/PT9Ua+Ci0uBkKnS/f1gO3kuF8rm+jy
	WVRg==
X-Received: by 10.50.136.165 with SMTP id qb5mr25904815igb.2.1390950738093;
	Tue, 28 Jan 2014 15:12:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 28 Jan 2014 15:11:47 -0800 (PST)
In-Reply-To: <1390912914-31576-7-git-send-email-fathi.boudra@linaro.org>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
	<1390912914-31576-7-git-send-email-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2014 15:11:47 -0800
Message-ID: <CAMKF1sqUSgy4ps58BWWX4ygCaOV+QbDSN4A=f8vXTPTMY6K7qw@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 6/6] ltp: fix ffsb ftbfs on cross-compiled environment
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
X-List-Received-Date: Tue, 28 Jan 2014 23:12:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 28, 2014 at 4:41 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Add ffsb-remove-hardcoded-configure.patch: get rid of the hardcoded configure call preventing cross-compilation
> Add do_configure_prepend to explicitly force regeneration the configure file and pass configure options as appropriate.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  .../ltp/ltp/ffsb-remove-hardcoded-configure.patch         | 15 +++++++++++++++
>  meta/recipes-extended/ltp/ltp_20140115.bb                 |  7 +++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
> new file mode 100644
> index 0000000..9f02711
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
> @@ -0,0 +1,15 @@
> +Get rid of the hardcoded configure call preventing cross-compilation
> +
> +Upstream-Status: Pending
> +Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> +
> +--- a/utils/Makefile
> ++++ b/utils/Makefile
> +@@ -29,7 +29,6 @@ FILTER_OUT_DIRS              := $(FFSBDIR)
> + FFSB                  := $(FFSBDIR)/ffsb
> +
> + $(FFSB): $(FFSBDIR)
> +-      cd $^; ./configure
> +       $(MAKE) -C $^ -f "$(abs_srcdir)/$^/Makefile" all
> +       cp $(FFSBDIR)/ffsb ffsb
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
> index 4e20f24..2ab1d50 100644
> --- a/meta/recipes-extended/ltp/ltp_20140115.bb
> +++ b/meta/recipes-extended/ltp/ltp_20140115.bb
> @@ -25,6 +25,7 @@ SRCREV = "c8b3e28097e7d3208df9daceaf92c25eae87ebf0"
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
>      file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
>      file://regen-makefile.patch \
> +    file://ffsb-remove-hardcoded-configure.patch \
>  "
>
>  S = "${WORKDIR}/git"
> @@ -36,6 +37,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
>  export prefix = "/opt/ltp"
>  export exec_prefix = "/opt/ltp"
>
> +# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
> +# we explicitly force regeneration of that directory and pass configure options.
> +do_configure_prepend() {
> +    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})

you should pass ${CONFIGUREOPTS} to autoreconf as well

> +}
> +
>  do_install(){
>      install -d ${D}/opt/ltp/
>      oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

