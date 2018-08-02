Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1EA78C5F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 21:44:16 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id k25-v6so2474546uao.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=5cp8JRz9/9G+m9Hmff4XpEUrgWNqS9MlOn90zAFEME8=;
	b=vMbl/asDnZzsT66tQyzYZLy3CSF8KH/ID/MYtmtEfnc9Np6D3OShf93lWIAe9F9pYN
	vQ0Jyycrr9apKBeMU7LpOGHpPxZ2hIKKopiGf+R1ZLqMOH0pCR9PkD5pG3bHt5Ag04mt
	0rfE0vybzFX3820bBYuFZqZYj/vTTnOJfV4p4Q3EWrIgeRO7L1LR7io3es7ANjV8pd48
	QfZdjH0aW2l2JkzqVykNMEtF4QZszFto+1A0gALquONK1MRryIbdjSTncYT1OBD8aGTE
	Wu988WD4TihZAeEjKNyPPrOtThhDk4LHRmllSKG5NrM6qryrQy8I++06wFFUxx58EFZ8
	fw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=5cp8JRz9/9G+m9Hmff4XpEUrgWNqS9MlOn90zAFEME8=;
	b=j475NG5VdYugBwYLtCCmsl4p++2UsEATDu3pg8p82S/G4U0wPCOoyo7+PGsa8Ea+32
	IhktVDAQQeuBVIDe93lpnlV43/bWT8nrnAFhT27Y/NOYNXYo0NSpWgfGqP2KtBTi5c7o
	5eHeTUkGGOGnSMwwOmabiEF3P12YMmuooBwbDaAo0owqE6+SVxEZ1RQDZSVg0AeCyd4p
	3CS3NNMEKYm+rgBiC9h1Sw0sIjbvcVCxU9xbdxUaYntSX6kMN90wnYQZOfNq293HY0I0
	mOOKrgtFpw+WePMgfm5XuOAblg74LsCAfaIKGksM7BrEcEE4Jj6hiXPKpYtLnG49/MHh
	TnEA==
X-Gm-Message-State: AOUpUlHie7yJBvgS5lDLEvqc0wtn+yCmISa/dJjT9gCWtdNil3TMro/h
	HRss8PFuTmsZrLKfVnmr55CspFPi6jMtWvR8USPBX3Ss
X-Google-Smtp-Source: AAOMgpd35bbLfargBkX30jx0YExQGSn63qmKC+Dbcn/QiTvy1jSS1SVyoaeEqRrK4VBgjGJWS7WVSgnUIR/8QIr598E=
X-Received: by 2002:ab0:458f:: with SMTP id
	u15-v6mr954073uau.202.1533246257605; 
	Thu, 02 Aug 2018 14:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <1532061197-12148-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1532061197-12148-1-git-send-email-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 2 Aug 2018 22:44:06 +0100
Message-ID: <CAO5Uq5Sao3gDW5do-=cKyC+X1DNhWxsFYyKvU4cW=n9M70QSZA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Thu, 02 Aug 2018 21:44:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 20, 2018 at 5:33 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> To handle the case where ${COREBASE} isn't the git directory, avoid
> erroring out when the git command fails. If we don't have a timestamp
> after this, fall back to the timestamp from conf/bitbake.conf.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
> Changes in v2:
> - Revert to original behaviour and use ${COREBASE} as per Richard Purdie's
>   advice
>
>  meta/classes/image.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index adc50c9..48961b6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
>  reproducible_final_image_task () {
>      if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
>          if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
> +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
> +            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
> +                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> +            fi
>          fi
>          # Set mtime of all files to a reproducible value
>          bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> --
> 2.7.4
>

Ping?

-- 
Alex Kiernan

