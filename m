Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0120471A88
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:31:26 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c47so354967995qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vmtZRWs1ZDrJqL6JzvfUwtS01Ii28+c014z9YROhYn4=;
	b=JU+eaWG8G/Qki5qhhaq67Lq70RlK0qPN6U97gJFHeaRzB9fnwEc5Q4QWUhSW/wowZo
	GMggYpZGdU1D+MKfRmVCZW7Cofn+FXT+HDr4Kp64Ta2UqluQbxskF0MKMbygz4shY6TD
	rjr7yZdLZR2erDmNxlatQ2AzWGv+NneV0tuaPsqs1smHBPffUjG/uy8CJiudS+tkpf9f
	eEQAA1HfoY9pI1Lun2HXy/AKWvKXr8v43O0VasiWKpXYMS2dFD2S2gTKIhZAcnhTDnIu
	mI4yH4HAHbRaekHqfJ0ir+345MtGztkZ2Q6Yr1QB4bcIVwFFBDfQWlBuXFVNQE+h2Jy3
	/MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vmtZRWs1ZDrJqL6JzvfUwtS01Ii28+c014z9YROhYn4=;
	b=NZv6BfSDRAHjdSRRClWzwqEi4QtD5nIEqGkVjAGoIQZgnDMnFnCVKdafSgXtLaIwTA
	1KknWil54Z/D1F18jmKLxOlvSolj8XHuP7kn1f5AdYalghq89KMUyyd2C9sQVzjE0+Cy
	LHsQq3TjOVaFveNqVWpLgIPLFn+jUSIoMuYcbt69Zqyc2AQj6un1ycHmzflZodnPJ50v
	KfFrE2wjrlWUGmEug9sVDLewOOaDTa23y0GuMjIAITAsdrdYCqh+q9C9o26ldLC9XHkn
	QdYHM4Hnj0NxmKH05Rz/yK9Cgx3sX8r2IRFdA6B9lPxpmvi6Em5QvB3qZBi4yqEg0qyi
	Qy4w==
X-Gm-Message-State: AKaTC02sHGm9+DUU7J1lrcM1cwG6iTo1EfSk+xqJuOgjbvxOGbu2um/ADfSXIflGLEGH/ExVa1VoprxC8BXNcTJT
X-Received: by 10.200.57.54 with SMTP id s51mr54797708qtb.68.1481049087865;
	Tue, 06 Dec 2016 10:31:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 10:31:07 -0800 (PST)
In-Reply-To: <1481024991-5882-2-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-2-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 18:31:07 +0000
Message-ID: <CAJTo0LZ3bP8oU0u8y2NrAyG+=ufNwfBR+Ueaau9Rb-QZnVY0tg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/33] dpkg: implement offline mode for update-alternatives
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
X-List-Received-Date: Tue, 06 Dec 2016 18:31:27 -0000
Content-Type: multipart/alternative; boundary=001a113a01e8c7124d0543019ceb

--001a113a01e8c7124d0543019ceb
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> +++ b/meta/recipes-devtools/dpkg/dpkg/0003-update-alternatives-
> Implement-offline-mode.patch
> @@ -0,0 +1,399 @@
> +From b4f0f6ced469095a2b21ddddb01b59c7aded057e Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Thu, 28 Aug 2014 05:20:21 +0200
> +Subject: [PATCH] update-alternatives: Implement offline mode
> +
> +Lets update-alternatives manage symlinks inside a cross-arch root
> +filesystem in a directory specified by DPKG_ROOT.
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>

This patch needs an Upstream-Status.

Ross

--001a113a01e8c7124d0543019ceb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2g2" cla=
ss=3D"a3s aXjCH m158d3f94c4f41a02">+++ b/meta/recipes-devtools/dpkg/<wbr>dp=
kg/0003-update-alternatives-<wbr>Implement-offline-mode.patch<br>
@@ -0,0 +1,399 @@<br>
+From b4f0f6ced469095a2b21ddddb01b59<wbr>c7aded057e Mon Sep 17 00:00:00 200=
1<br>
+From: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.org">obi@o=
pendreambox.org</a>&gt;<br>
+Date: Thu, 28 Aug 2014 05:20:21 +0200<br>
+Subject: [PATCH] update-alternatives: Implement offline mode<br>
+<br>
+Lets update-alternatives manage symlinks inside a cross-arch root<br>
+filesystem in a directory specified by DPKG_ROOT.<br>
+<br>
+Signed-off-by: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.o=
rg">obi@opendreambox.org</a>&gt;</div></blockquote></div><br>This patch nee=
ds an Upstream-Status.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113a01e8c7124d0543019ceb--
