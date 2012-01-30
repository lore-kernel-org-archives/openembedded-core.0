Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RroJ1-0003G7-Ns
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 11:17:47 +0100
Received: by werc1 with SMTP id c1so3216721wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 02:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hWS6IC49raEtgWbZgCRKuowxZGcG0MmKQu5hDqCHk3Y=;
	b=oftiaztwHOSqegiQ1tG1s/VJFFM3wsn9TWnfwXk8FhQ8kPD8GZE105c7HcA6TepaD+
	AhJb7/VFjfKEIYPWQHz9HFR5rvzkdhxZ0PbpIqbt4qaG94Gps/cmcRNVAAg7aEKw70nY
	NTHnzuumpImG4CGBPJDKqLYDM51UzkYwQIBjw=
MIME-Version: 1.0
Received: by 10.216.138.220 with SMTP id a70mr8646333wej.24.1327918195538;
	Mon, 30 Jan 2012 02:09:55 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Mon, 30 Jan 2012 02:09:55 -0800 (PST)
Date: Mon, 30 Jan 2012 11:09:55 +0100
Message-ID: <CAGiJk9efnMcaNSE9wreO3MtuEpm2H5vCv4+GGT9GqVL6+LcFMw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Qt4 native broken include directories?
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
X-List-Received-Date: Mon, 30 Jan 2012 10:17:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
qmake2.bbclass exports the Qt include directory to the qt4 directory:
export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"


But it seems like the do_install of Qt native went wrong and it was
installed in the following directories:
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/Qt
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/Qt3Support
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtCore
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtDBus
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtGui
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtNetwork
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtSql
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtTest
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtXml
file:///work/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/QtXmlPatterns

Is this intended?
It might be related to Otavios patch [1], but I can't connect it as I
don't see Qt4-native including qt4-x11-free.inc.


For me the result is: all native recipes that depend on Qt fail with
missing include errors.
As I am currently porting Plasma-Active two and the KDElibs + CMake
(IMHO) is a BBOM,
I currently see no way how to get around this by configuring CMake or
setting any options.

Help would be very appreciated.


[1] http://cgit.openembedded.org/openembedded-core/commit/?id=73fc8f706b08ec74087754eacd2257856fe829d1
-- 
Regards
Samuel


