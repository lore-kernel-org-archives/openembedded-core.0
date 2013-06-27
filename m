Return-Path: <sakoman@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB266007C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 12:56:57 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id up14so688569obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=aLqLu2sPG3fES4ao3ZxpZ30FRY9Kciv4Z+2mzpEtgYs=;
	b=NFRlxJKSP80xsfTirTFaTu96QZWW/30g04l4CAu6ZUhYqzmZd6w9ik79G38GI3K7Z8
	uquWJEsFDNO325NZMEpCfLbOJqVRM1mTaoz13qY2b33lruXZfQsES99plGr3hOeMQ+qr
	Uzc+oHukOS4dMsKUeAFlrn5NLAVOlU9ETM9SroZNrx4NTpiWX0hk/IeTPXJlR6VoyfOG
	AYRs0dxGd+3W6EE490MSZA4PS21T0hpuzxODGwiH5TLbWAEBGv5V7kC3Li5jx1pgDxai
	BZMOFqOaeeKEqpd/mNZN12/aqfTDVGWSB61KvwRGWcF3MzLN9BG+XXSyDZJagigDwzW+
	sgAQ==
MIME-Version: 1.0
X-Received: by 10.60.142.103 with SMTP id rv7mr2751708oeb.13.1372337815692;
	Thu, 27 Jun 2013 05:56:55 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Thu, 27 Jun 2013 05:56:55 -0700 (PDT)
In-Reply-To: <20130627100346.35932ab8@e6520eb>
References: <CAGDS+nmpNmSwSV9qW3aQ22BBkss1PhCVtg7A-JzSx+bL-ngqCQ@mail.gmail.com>
	<20130627100346.35932ab8@e6520eb>
Date: Thu, 27 Jun 2013 05:56:55 -0700
Message-ID: <CAGDS+nnLHmxBTtJ4tqQEFPmkD-4Nz9HHvBxBB-RyfHOhQy5ebA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Qt embedded, touchscreens, and cursors
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
X-List-Received-Date: Thu, 27 Jun 2013 12:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 1:03 AM, Eric B=E9nard <eric@eukrea.com> wrote:

> IIRC you can hack this in
> qwscursor_qws.cpp
> around "// default cursor"
> you change ArrowCursor to BlankCursor
> (sorry no clean patch for that ATM).

Hi Eric,

That is exactly what I ended up doing.  The -no-feature-CURSOR
approach caused too many issues, i.e. breakage in demos, samples, and
tools.

For the record, here is the patch I used:

diff --git a/src/gui/embedded/qwscursor_qws.cpp
b/src/gui/embedded/qwscursor_qws.cpp
index 9e8c235..0ff0dc3 100644
--- a/src/gui/embedded/qwscursor_qws.cpp
+++ b/src/gui/embedded/qwscursor_qws.cpp
@@ -344,7 +344,7 @@ void QWSServerPrivate::initializeCursor()

     // default cursor
     cursor =3D 0;
-    setCursor(QWSCursor::systemCursor(Qt::ArrowCursor));
+    setCursor(QWSCursor::systemCursor(Qt::BlankCursor));
 #endif
     q->sendMouseEvent(QPoint(swidth/2, sheight/2), 0);
 }

