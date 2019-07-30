Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id E53077F302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:32:36 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p17so61259868ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 01:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T4xaGFoO4KhRcsao4S2edxXpHoRO4J627unYjAmBzXI=;
	b=OLKUC9d/cSNsE7rEsC7R3u1Gm811xXMF9sIwahf17QJbobSwykoIeEQSgSOMAtXkCv
	F6rGvET0xGC62MaNmgk5i3NtcVN4TlJ/mVmgh+T+TDeYFw0ByPWVr8usnbBrhPATcn0n
	TF5WqigG/kZykx4bgJ2rZpouxsBEYCS4B1P+CBlkBsEmhNNaFBzuxGcLYH6+OzgOt7nV
	r6q/80dRQR5N9MU4qVAFDpxtHwBjftyqk5qv033rygxZYyyWL8CjHfJAmJfA46ba+VYo
	/D+AzSNzWF+QJ6g50oq8puR8nAdZbv7c52A3CgTx2G5bWy/JT0c63MlB1c8jsZd0/ph0
	Y4gg==
X-Gm-Message-State: APjAAAWLZvvZ0FxwDsWk46eDu5clDxRVQJbNOOzK/h5ZnLA/uz5K/wnE
	GvPFwHU2upea4/vIpopgoU35TF9C69EJZGaItbVtwD8b
X-Google-Smtp-Source: APXvYqz8rMJsfSg1aNpkuGmWx3QfItAKYWTOnsWXLIe2cXZLD3NBC4BpabQkV/MStk3/7+0IiytYp0GB5zketn1q+7g=
X-Received: by 2002:a2e:3013:: with SMTP id w19mr60543048ljw.73.1564475557351; 
	Tue, 30 Jul 2019 01:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190718194615.6874-1-ricardo@ribalda.com>
	<CAMKF1spj-LXk1=YxeErV7UHVtWJmacjP1M-_W6M=4ZnSkaFk_w@mail.gmail.com>
	<CAPybu_2tkssPOt8G1ZFZ6s9++7h0KhZV872tFccRXdRYuR=i-Q@mail.gmail.com>
	<CAMKF1sqzAbADXCR1gW07-j1L=RLWEWJJur8gVZ4GC=xA04KfNA@mail.gmail.com>
	<CAPybu_3Ho8UJXhAnogaGw9QucD=4zdjmjWmeZ9iUuW4VLrha9g@mail.gmail.com>
In-Reply-To: <CAPybu_3Ho8UJXhAnogaGw9QucD=4zdjmjWmeZ9iUuW4VLrha9g@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Tue, 30 Jul 2019 10:32:20 +0200
Message-ID: <CAPybu_1ZFJfjDqaPGnDrV_d6axAfA1b6qkpXO3BW0=Ep7sVanA@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Jul 2019 08:32:37 -0000
Content-Type: text/plain; charset="UTF-8"

ping?

On Fri, Jul 19, 2019 at 8:12 AM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Hi Khem
>
> Indeed is due to that, but infortunately it is part of arpa/tftp.h .
> So the propossed solutionI believe that it is simpler.
>
> https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>
> Also is what I have been suggested in #gcc
>
>
> Thanks!
>
> On Fri, Jul 19, 2019 at 12:39 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Jul 18, 2019 at 2:10 PM Ricardo Ribalda Delgado
> > <ricardo@ribalda.com> wrote:
> > >
> > > Hi Khem
> > >
> > > I think the issue is that __memcpy_chk wrongly assume that the target
> > > size is 0. The origin size is calculated fine:
> > >
> > > https://godbolt.org/z/qTaDWP
> > >
> >             char tu_data[0];    /* data or error string */
> >
> > that seems an old stype variable length array
> > can you change it to char tu_data[] and see if it helps
> >
> > > Thanks!
> > >
> > > On Thu, Jul 18, 2019 at 11:02 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 18, 2019 at 12:46 PM Ricardo Ribalda Delgado
> > > > <ricardo@ribalda.com> wrote:
> > > > >
> > > > > When the code is compiled with  "-fstack-protector-strong
> > > > > -D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
> > > > > it crashes with the following error:
> > > > >
> > > > > *** buffer overflow detected ***:
> > > > > Aborted
> > > > >
> > > > > This seems to be a bug/feature of gcc. A bug has been open on their
> > > > > bugzilla, and also inetutils have been posted with the proposed patch.
> > > > >
> > > > > Without this patch, pxelinux fails to boot because it keeps asking the
> > > > > server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > ---
> > > > >  .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
> > > > >  .../inetutils/inetutils_1.9.4.bb              |  1 +
> > > > >  2 files changed, 26 insertions(+)
> > > > >  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > > >
> > > > > diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > > > new file mode 100644
> > > > > index 0000000000..a91913cb51
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > > > @@ -0,0 +1,25 @@
> > > > > +tftpd: Fix abort on error path
> > > > > +
> > > > > +When trying to fetch a non existent file, the app crashes with:
> > > > > +
> > > > > +*** buffer overflow detected ***:
> > > > > +Aborted
> > > > > +
> > > > > +
> > > > > +Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
> > > > > +Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > +diff --git a/src/tftpd.c b/src/tftpd.c
> > > > > +index 56002a0..144012f 100644
> > > > > +--- a/src/tftpd.c
> > > > > ++++ b/src/tftpd.c
> > > > > +@@ -864,9 +864,8 @@ nak (int error)
> > > > > +       pe->e_msg = strerror (error - 100);
> > > > > +       tp->th_code = EUNDEF;   /* set 'undef' errorcode */
> > > > > +     }
> > > > > +-  strcpy (tp->th_msg, pe->e_msg);
> > > > > +   length = strlen (pe->e_msg);
> > > >
> > > > I wonder if length calculation is a problem as well here, if so then
> > > > it would need
> > > > correcting because it used in code below as well.
> > > >
> > > > > +-  tp->th_msg[length] = '\0';
> > > > > ++  memcpy(tp->th_msg, pe->e_msg, length + 1);
> > > > > +   length += 5;
> > > > > +   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
> > > > > +     syslog (LOG_ERR, "nak: %m\n");
> > > > > diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > > > index ac2e017d8b..684fbe09e1 100644
> > > > > --- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > > > +++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > > > @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> > > > >             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> > > > >             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> > > > >             file://0001-rcp-fix-to-work-with-large-files.patch \
> > > > > +           file://fix-buffer-fortify-tfpt.patch \
> > > > >  "
> > > > >
> > > > >  SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> > > > > --
> > > > > 2.20.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
> > > Thanks!
> > >
> > > On Thu, Jul 18, 2019 at 11:02 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 18, 2019 at 12:46 PM Ricardo Ribalda Delgado
> > > > <ricardo@ribalda.com> wrote:
> > > > >
> > > > > When the code is compiled with  "-fstack-protector-strong
> > > > > -D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
> > > > > it crashes with the following error:
> > > > >
> > > > > *** buffer overflow detected ***:
> > > > > Aborted
> > > > >
> > > > > This seems to be a bug/feature of gcc. A bug has been open on their
> > > > > bugzilla, and also inetutils have been posted with the proposed patch.
> > > > >
> > > > > Without this patch, pxelinux fails to boot because it keeps asking the
> > > > > server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > ---
> > > > >  .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
> > > > >  .../inetutils/inetutils_1.9.4.bb              |  1 +
> > > > >  2 files changed, 26 insertions(+)
> > > > >  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > > >
> > > > > diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > > > new file mode 100644
> > > > > index 0000000000..a91913cb51
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > > > @@ -0,0 +1,25 @@
> > > > > +tftpd: Fix abort on error path
> > > > > +
> > > > > +When trying to fetch a non existent file, the app crashes with:
> > > > > +
> > > > > +*** buffer overflow detected ***:
> > > > > +Aborted
> > > > > +
> > > > > +
> > > > > +Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
> > > > > +Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > +diff --git a/src/tftpd.c b/src/tftpd.c
> > > > > +index 56002a0..144012f 100644
> > > > > +--- a/src/tftpd.c
> > > > > ++++ b/src/tftpd.c
> > > > > +@@ -864,9 +864,8 @@ nak (int error)
> > > > > +       pe->e_msg = strerror (error - 100);
> > > > > +       tp->th_code = EUNDEF;   /* set 'undef' errorcode */
> > > > > +     }
> > > > > +-  strcpy (tp->th_msg, pe->e_msg);
> > > > > +   length = strlen (pe->e_msg);
> > > >
> > > > I wonder if length calculation is a problem as well here, if so then
> > > > it would need
> > > > correcting because it used in code below as well.
> > > >
> > > > > +-  tp->th_msg[length] = '\0';
> > > > > ++  memcpy(tp->th_msg, pe->e_msg, length + 1);
> > > > > +   length += 5;
> > > > > +   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
> > > > > +     syslog (LOG_ERR, "nak: %m\n");
> > > > > diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > > > index ac2e017d8b..684fbe09e1 100644
> > > > > --- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > > > +++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > > > @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> > > > >             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> > > > >             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> > > > >             file://0001-rcp-fix-to-work-with-large-files.patch \
> > > > > +           file://fix-buffer-fortify-tfpt.patch \
> > > > >  "
> > > > >
> > > > >  SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> > > > > --
> > > > > 2.20.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

