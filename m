Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id E015370B6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 14:17:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id C12381169666;
	Mon, 11 Aug 2014 16:17:31 +0200 (CEST)
Message-ID: <1407766651.28332.1.camel@open-rnd.pl>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 11 Aug 2014 16:17:31 +0200
In-Reply-To: <1405977822.3067.26.camel@empanada>
References: <1405940517-30651-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1405977822.3067.26.camel@empanada>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.12.4 (3.12.4-1.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-code][PATCH] wic: include partition label in fs image file name
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
X-List-Received-Date: Mon, 11 Aug 2014 14:17:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On pon, 2014-07-21 at 16:23 -0500, Tom Zanussi wrote:
> On Mon, 2014-07-21 at 13:01 +0200, Maciej Borzecki wrote:
> > Not including the label image but having multiple partitions of the same
> > type, the image file of one partition would overwrite the other.
> > 
> 
> Right, the empty-partition case somehow missed the label - good catch.
> 
> Acked-by: Tom Zanussi <tom.zanussi@linux.intel.com>


Saul, I think that the patch was missed by due to malformed subject
line. Would you be able to push it to master?

> 
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > ---
> >  scripts/lib/mic/kickstart/custom_commands/partition.py | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > index 06f29a9..d0f1b78 100644
> > --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> > +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> > @@ -343,7 +343,7 @@ class Wic_PartData(Mic_PartData):
> >          """
> >          Prepare an empty ext2/3/4 partition.
> >          """
> > -        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
> > +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> >          dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
> >              (fs, self.size)
> > @@ -363,7 +363,7 @@ class Wic_PartData(Mic_PartData):
> >          """
> >          Prepare an empty btrfs partition.
> >          """
> > -        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
> > +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> >          dd_cmd = "dd if=/dev/zero of=%s bs=1M seek=%d count=0" % \
> >              (fs, self.size)
> > @@ -384,7 +384,7 @@ class Wic_PartData(Mic_PartData):
> >          """
> >          Prepare an empty vfat partition.
> >          """
> > -        fs = "%s/fs.%s" % (cr_workdir, self.fstype)
> > +        fs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
> >  
> >          blocks = self.size * 1024
> >  
> 
> 


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



