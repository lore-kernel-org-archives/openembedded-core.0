Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Ry194-0005Qn-5y
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 14:13:10 +0100
Received: by wgbdr13 with SMTP id dr13so1713641wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 05:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1VmzaDHF9UD7e+NK/1vr+x1qM2GWFtQyYyIVnycK4HY=;
	b=sZNBLtDrUurTuin6Zv2lWRckj+hjuEyLKqX8T8xy+E+NfkIYsd/1TLQRy+Qhjp/uRh
	kjKJLOej3xwN3tgIEJ6kWc2lvLo27j+edb0qE/yZGfnMAbywGBjGeEvTTT0q5BwcijWt
	JKz74TRDHz3t7eIsxzpev5KslZ+A9Utaml/xc=
MIME-Version: 1.0
Received: by 10.181.11.227 with SMTP id el3mr4344753wid.18.1329397497291; Thu,
	16 Feb 2012 05:04:57 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Thu, 16 Feb 2012 05:04:57 -0800 (PST)
Date: Thu, 16 Feb 2012 14:04:57 +0100
Message-ID: <CAGiJk9ddcv7C7gZbR7a5+YVXfwyX_igRWCWyCR16TggQUrfcYg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC: Qt session management is disabled via QT_DISTRO_FLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2012 13:13:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
my attempts to work around this didn't work out so maybe anyone else
has a good idea.

First of, the Qt session management is a build time dependency of
kdelibs, disabling the components that need it will make it impossible
to build Plasma Active.



The direct error message in kdelibs4:
git/kdeui/kernel/kapplication.cpp:329:2: error: #error
QT_NO_SESSIONMANAGER was set, this will not compile. Reconfigure Qt
with Session management support.
git/kdeui/kernel/ksessionmanager.h:60:27: error: 'QSessionManager' has
not been declared

After a bit of tracing it has become visible that the header files
exists in an inactive status due to Qt defines.

In qt4-x11-free log.do_compile:
kernel/qsessionmanager.h:0: Note: No relevant classes found. No output
generated.

The problem:
In qt4.inc the "-no-sm" disables session management (QT_DISTRO_FLAGS
?= "-no-accessibility -no-sm").

If it would be possible to disable Nepomuk in Plasma Active, then this
would be no problem, but this is not intended by the KDE devs...


Anyone knows if enabling session management in Qt is a bad idea, or if
there is another way of solving this?


-- 
Regards
Samuel


