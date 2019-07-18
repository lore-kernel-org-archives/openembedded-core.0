Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B1D887CFE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 21:10:13 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x25so28770950ljh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 14:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ExoXelNUkY2hjSKEqmaKMQo76x8CjOqoSAs/OjcMNM=;
	b=fDG5qK52YvHJVK+sMFF41gsVTwva/fwPpR3tw+tbenq8JDc/8RG8IPMJnThdnkQTLI
	8BkaPWq3F1GCGJhnZyAaG5WE2BTshpgAU/w5M4zNWt7U8Pz12BSpsc4T6kLGD0q9wOzD
	mlVXNtfhhTtxKi+GQkk89KEnW8nTecp1FhSlYpAf0dKwjByasVcpow2nmic/oFbvwmfP
	Fv9LeM7LJ7/b/zEE4h4tyoHJhVza1EHN+fPyT+BlEXJYkefpG3DZkmAWvXJRKYZYL6gl
	lr+uTM5ClIrm8rLmb+YO/bz5qwE2GvZv5P8NpcrirxF5JQDlSW0VhyOHK/7kWf+dncx/
	6Iag==
X-Gm-Message-State: APjAAAX//e0cGpkw2HuJ4C2RuaINQZQrBCVQNFTzSw2NRfUzK/QE4nGi
	oQFzZPfyMTPcp2iwGkrBNDJrVnZW8WWKU7RMI5o=
X-Google-Smtp-Source: APXvYqxMVhaDGjzZv/rf6uqlH3kluslOvU50c5Fcp2K4EUIXU0Roc/lP0xce0j+v85psfJlNjAyECnCGnR4l8CH1xLs=
X-Received: by 2002:a2e:3013:: with SMTP id w19mr25513247ljw.73.1563484214335; 
	Thu, 18 Jul 2019 14:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190718194615.6874-1-ricardo@ribalda.com>
	<CAMKF1spj-LXk1=YxeErV7UHVtWJmacjP1M-_W6M=4ZnSkaFk_w@mail.gmail.com>
In-Reply-To: <CAMKF1spj-LXk1=YxeErV7UHVtWJmacjP1M-_W6M=4ZnSkaFk_w@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Thu, 18 Jul 2019 23:09:57 +0200
Message-ID: <CAPybu_2tkssPOt8G1ZFZ6s9++7h0KhZV872tFccRXdRYuR=i-Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 18 Jul 2019 21:10:14 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem

I think the issue is that __memcpy_chk wrongly assume that the target
size is 0. The origin size is calculated fine:

https://godbolt.org/z/qTaDWP

Thanks!

On Thu, Jul 18, 2019 at 11:02 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jul 18, 2019 at 12:46 PM Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
> >
> > When the code is compiled with  "-fstack-protector-strong
> > -D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
> > it crashes with the following error:
> >
> > *** buffer overflow detected ***:
> > Aborted
> >
> > This seems to be a bug/feature of gcc. A bug has been open on their
> > bugzilla, and also inetutils have been posted with the proposed patch.
> >
> > Without this patch, pxelinux fails to boot because it keeps asking the
> > server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
> >  .../inetutils/inetutils_1.9.4.bb              |  1 +
> >  2 files changed, 26 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> >
> > diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > new file mode 100644
> > index 0000000000..a91913cb51
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > @@ -0,0 +1,25 @@
> > +tftpd: Fix abort on error path
> > +
> > +When trying to fetch a non existent file, the app crashes with:
> > +
> > +*** buffer overflow detected ***:
> > +Aborted
> > +
> > +
> > +Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
> > +Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > +diff --git a/src/tftpd.c b/src/tftpd.c
> > +index 56002a0..144012f 100644
> > +--- a/src/tftpd.c
> > ++++ b/src/tftpd.c
> > +@@ -864,9 +864,8 @@ nak (int error)
> > +       pe->e_msg = strerror (error - 100);
> > +       tp->th_code = EUNDEF;   /* set 'undef' errorcode */
> > +     }
> > +-  strcpy (tp->th_msg, pe->e_msg);
> > +   length = strlen (pe->e_msg);
>
> I wonder if length calculation is a problem as well here, if so then
> it would need
> correcting because it used in code below as well.
>
> > +-  tp->th_msg[length] = '\0';
> > ++  memcpy(tp->th_msg, pe->e_msg, length + 1);
> > +   length += 5;
> > +   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
> > +     syslog (LOG_ERR, "nak: %m\n");
> > diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > index ac2e017d8b..684fbe09e1 100644
> > --- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > +++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> >             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> >             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> >             file://0001-rcp-fix-to-work-with-large-files.patch \
> > +           file://fix-buffer-fortify-tfpt.patch \
> >  "
> >
> >  SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Ricardo Ribalda

