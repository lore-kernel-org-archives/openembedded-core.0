Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id B7BD260097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:17:00 +0000 (UTC)
Received: from comp-006-thk.localnet (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 07BB637EECE;
	Wed, 22 Oct 2014 10:16:57 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Philip Balister <philip@balister.org>
Date: Wed, 22 Oct 2014 10:16:57 +0200
Message-ID: <1674569.uPgRA3xl4g@comp-006-thk>
User-Agent: KMail/4.14.2 (Linux/3.16.6-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <2808693.YK3zlpjAPq@comp-006-thk>
References: <54454A41.7090900@balister.org> <2808693.YK3zlpjAPq@comp-006-thk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wic debug suggestions
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
X-List-Received-Date: Wed, 22 Oct 2014 08:17:08 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday 22 of October 2014 09:03:03 Maciej Borzecki wrote:
> On Monday 20 of October 2014 13:45:37 Philip Balister wrote:
> > I'm trying to make an sd card using the sdimage-bootpart.wks file. =
I've
> > made an image and dd'ed it to a card. The card has a good vfat
> > partition, but the ext4 partition won't mount. Looks like bad
> > superblock. I can format the partition manually, so partitions seem=
 OK
> > and card works.
> >=20
> > Does anyone have any suggestions for debugging this?
>=20
> In default wks, the vfat partition is /boot, ext4 is /. If I understo=
od you
> correctly / fails to mount, is that right?
>=20
> I've rebuilt an image with poky rev
> 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3. Loading via loopback and mo=
unting
> partition 2 (/ in this case) works fine.

Verified with current master 924da20c6f2f183fa7e930e4c3c6b14c090acbe5, =
works=20
fine. The image works both as loopback and in BeagleBone Black.

>=20
> Can you post the output this command?
>   wic create -D -e core-image-minimal sdimage-bootpart
>=20
> Ext4 image is built by image.bbclass (Tom, please correct me if I'm w=
rong on
> this). It should be possible to do the loopback/mount thing with the =
image
> file as well. Can you check if you can mount it this way?
Disregard this statement as it is incorrect. I forgot that wic builds a=
ll=20
images separately from bitbake. The temp ext4 appears only if you have =
run wic=20
at this location: /var/tmp/wic/build/rootfs_root.ext4. Try to mount tha=
t.

Also try running tune2fs -l /var/tmp/wic/build/rootfs_root.ext4 to see =
if that=20
produces any reasonable output.

--=20

Maciej Borz=C4=99cki=20
Senior Software Engineer Open-RnD Sp. z o.o.=20
www.open-rnd.pl, Facebook, Twitter=20
mobile: +48 telefon, fax: +48 42 657 9079=20

Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe z=
awiera=C4=87 chronione prawem lub=20
poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wi=
adomo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 =
zosta=C5=82a otrzymana przypadkowo=20
zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzec=
ich. W takim przypadku=20
uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poin=
formowanie=20
nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwro=
tnej. Dzi=C4=99kujemy.=20

This message, including any attachments hereto, may contain privileged =
or=20
confidential information and is sent solely for the attention and use o=
f the=20
intended addressee(s). If you are not an intended addressee, you may ne=
ither=20
use this message nor copy or deliver it to anyone. In such case, you sh=
ould=20
immediately destroy this message and kindly notify the sender by reply =
email.=20
Thank you. 

