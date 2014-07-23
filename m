Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id C5D1465D9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 19:37:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.8.238.232])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id B70762B029CA;
	Wed, 23 Jul 2014 21:37:31 +0200 (CEST)
Message-ID: <1406144251.9705.1.camel@localhost.localdomain>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Wed, 23 Jul 2014 21:37:31 +0200
In-Reply-To: <1406143292.6335.27.camel@empanada>
References: <1405978453-16554-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1406143292.6335.27.camel@empanada>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.12.3 (3.12.3-1.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] wic: original fstab restored too early
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: maciej.borzecki@open-rnd.pl
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jul 2014 19:37:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On śro, 2014-07-23 at 14:21 -0500, Tom Zanussi wrote:
> Sorry, I'm not seeing how this fixes the problem (best would be to
> explain that in the patch description too), or for that matter, how to
> reproduce the problem.  Could you elaborate?

Right, the wording might be unfortunate and not reflect what actually
happens behind the scenes.

DirectImageCreator.__write_fstab() generates new /etc/fstab in sysroot.
The contents are the original entries in /etc/fstab + the partitions
listed in *.wks (skipping / and /boot). A backup of the
original /etc/fstab is made in temp.

A counterpart call to DirectImageCreator.__restore_fstab() brings back
the original version into sysroot, so that the whole process does not
leave any files in the original tree.

The problem is that calling __restore_fstab() before
__instimage.add_partition() brings back the original fstab before the
partition file actually is built. As such, any extra partitions listed
in *.wks never make it to /etc/fstab. 

For instance I add an extra user data partition like this:

part /media/data --ondisk mmcblk0p --fstype=vfat --label data --...

will not be reflected in /etc/fstab and not mounted when system is
brought up. The patch resolves this problem.


-- 
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079

Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem
lub poufne informacje i została wysłana wyłącznie do wiadomości i
użytku osób, do których została zaadresowana. Jeśli wiadomość została
otrzymana przypadkowo zabrania się jej kopiowania lub rozsyłania do
osób trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o zaistniałej
sytuacji za pomocą wiadomości zwrotnej. Dziękujemy.

This message, including any attachments hereto, may contain privileged
or confidential information and is sent solely for the attention and
use of the intended addressee(s). If you are not an intended addressee,
you may neither use this message nor copy or deliver it to anyone. In
such case, you should immediately destroy this message and kindly notify
the sender by reply email. Thank you.



