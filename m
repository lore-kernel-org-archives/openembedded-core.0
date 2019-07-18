Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6711E7EF22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 21:01:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x22so23834030qtp.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p+KDn9UJx/I2HK3dL5W4AbuBB3Dd6+sDwFDbK+jCksQ=;
	b=pYmE7JTHhru1URY33mGBd/RLsxBwukFxLJ9rjlqSo17X1h5RYjIbwMMqzU//DOUzJA
	cN4w+vpMaiX8gUHEJAMmD/aHKYyiHBHM4ltMFp7rO9sJz1yiRoklmi8XjT7P98ftTfoM
	a+cj9YBSD1vwtv7B64Lmsj63rolI6zOvpWmDEK1j/XW8dGo9nc9MVhDZb8gHL7tCs7A/
	t94Kmi0lqel0jL7SRmmQ9Z3Czt2V/4434cPCDwlcIrJapl5GGB3+1YFLknjVzEHYj/Pj
	qEoY5eVZfQrtp43lbyOTVk1IrDuhdsoma2/4rBqAPRygKlWD/vS2+8ouEKGdhqcA5hxS
	QYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p+KDn9UJx/I2HK3dL5W4AbuBB3Dd6+sDwFDbK+jCksQ=;
	b=W1AgizzI3sviQC9JLUh4DPX2TrWopNP8sW+81HyD0JC/SqdkHjILfnksR4oINrjThL
	r7cgg1iQoobJgLJrNMLQ/5xIK62P2594swtMTZZqLjR0CAHcnVMDi13OyamZeiOi1Ju8
	krM143XGYVa1NJ/YxWXWxjUe1oMo0NrhBlXr5JshiG1EH9lwIGUWsLk8ZfrENBBseV8U
	vacTtB1ePbMKgQjKN+f3RxyszNV2LnYHTFE7MhvDCGCOBRBk4oP5SotvGdjicBSuL0Uw
	dVP4WgtghKhAw4+4McsQh8HIDxqE4Dq+q91kFSRzt0X8GeN3NDmdIJLwraugGQ1w/sfu
	ymNA==
X-Gm-Message-State: APjAAAWpw0ow/W6fY+CJS8cMTVD/Wud1xcLHJrL3LMGgOR262hvGAabK
	XLDo4BeFaXjGs7l8aj4GMkilSiOs76DAS1pdSjiv5PAQ
X-Google-Smtp-Source: APXvYqznz/NehSSf86cl2YhwmUN5+5JHlWjje1o5kqdkQklVRZ5e2Xkz1pfDuLDq0XOg0Jj2VldLMjNIRy8COM8kerA=
X-Received: by 2002:aed:3644:: with SMTP id e62mr33112908qtb.80.1563483705874; 
	Thu, 18 Jul 2019 14:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190718194615.6874-1-ricardo@ribalda.com>
In-Reply-To: <20190718194615.6874-1-ricardo@ribalda.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jul 2019 14:01:19 -0700
Message-ID: <CAMKF1spj-LXk1=YxeErV7UHVtWJmacjP1M-_W6M=4ZnSkaFk_w@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] inetutils: Fix abort on invalid files
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
X-List-Received-Date: Thu, 18 Jul 2019 21:01:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 18, 2019 at 12:46 PM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> When the code is compiled with  "-fstack-protector-strong
> -D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
> it crashes with the following error:
>
> *** buffer overflow detected ***:
> Aborted
>
> This seems to be a bug/feature of gcc. A bug has been open on their
> bugzilla, and also inetutils have been posted with the proposed patch.
>
> Without this patch, pxelinux fails to boot because it keeps asking the
> server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
>  .../inetutils/inetutils_1.9.4.bb              |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
>
> diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> new file mode 100644
> index 0000000000..a91913cb51
> --- /dev/null
> +++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> @@ -0,0 +1,25 @@
> +tftpd: Fix abort on error path
> +
> +When trying to fetch a non existent file, the app crashes with:
> +
> +*** buffer overflow detected ***:
> +Aborted
> +
> +
> +Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> +diff --git a/src/tftpd.c b/src/tftpd.c
> +index 56002a0..144012f 100644
> +--- a/src/tftpd.c
> ++++ b/src/tftpd.c
> +@@ -864,9 +864,8 @@ nak (int error)
> +       pe->e_msg = strerror (error - 100);
> +       tp->th_code = EUNDEF;   /* set 'undef' errorcode */
> +     }
> +-  strcpy (tp->th_msg, pe->e_msg);
> +   length = strlen (pe->e_msg);

I wonder if length calculation is a problem as well here, if so then
it would need
correcting because it used in code below as well.

> +-  tp->th_msg[length] = '\0';
> ++  memcpy(tp->th_msg, pe->e_msg, length + 1);
> +   length += 5;
> +   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
> +     syslog (LOG_ERR, "nak: %m\n");
> diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> index ac2e017d8b..684fbe09e1 100644
> --- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> +++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
>             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
>             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
>             file://0001-rcp-fix-to-work-with-large-files.patch \
> +           file://fix-buffer-fortify-tfpt.patch \
>  "
>
>  SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

