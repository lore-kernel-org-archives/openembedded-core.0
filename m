Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMDua-0003F9-HP
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 08:37:44 +0200
Received: by wye20 with SMTP id 20so135337wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 23:34:51 -0700 (PDT)
Received: by 10.216.232.146 with SMTP id n18mr213693weq.93.1305614090146;
	Mon, 16 May 2011 23:34:50 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o78sm88032wep.24.2011.05.16.23.34.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 23:34:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305587619.3424.134.camel@rex>
Date: Tue, 17 May 2011 08:34:46 +0200
Message-Id: <E79027E3-2F0B-40DF-8798-6AF5D6C3E4E8@dominion.thruhere.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
	<1305587619.3424.134.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: sstate breakage with multimachine
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
X-List-Received-Date: Tue, 17 May 2011 06:37:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2011, om 01:13 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-05-16 at 13:20 +0200, Koen Kooi wrote:
>> This bug gets reintroduced every other week, so let's try to fix it
>> properly this time. The situation:
>>=20
>> 2 machines (beagleboard, pandaboard) using the same base architecture
>> (armv7a).
>>=20
>> step 0: rm build pseudone -rf
>> step 1: MACHINE=3Dbeagleboard bitbake console-image
>> step 2: MACHINE=3Domap4430-panda bitbake console-image
>>=20
>> Step 0 and 1 work great, but I can't get step 2 to work. Attached is
>> the complete output of step 2. As you can see without any updates to
>> the repositories it wants to rebuild (e)glibc.
>>=20
>> Why does it wants to rebuild all that? Why does it fail?
>=20
> I had a look at this. Firstly, I figured out I needed an incantation =
to
> reproduce which turned out to be:
>=20
> git clone git://git.angstrom-distribution.org/setup-scripts
> git checkout oe-core
> MACHINE=3Dbeagleboard ./oebb.sh config beagleboard
> MACHINE=3Dbeagleboard ./oebb.sh bitbake console-image -S
> MACHINE=3Domap4430-panda ./oebb.sh bitbake console-image -S
>=20
> I added the -S option to dump sigdata files into the stamp directory =
so
> I didn't need to run two builds before being able to look at this. =
Sure
> enough, if you look
> at =
/media/build2/builds/angstrom/setup-scripts/build/tmp-angstrom_2010_x/stam=
ps/all-angstrom-linux-gnueabi
> update-rc.d* then the do_populate_lic task is duplicated as are the
> do_package and its subsequent tasks.
>=20
> Diffing the do_populate_lic task, it shows DEPLOY_DIR_IMAGE has a
> dependency on the MACHINE variable so its correctly rerunning the task
> for that reason. This is an Angstrom specific change and adding:=20
>=20
> DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MACHINE}"
> +DEPLOY_DIR_IMAGE[vardepsexclude] =3D "MACHINE"
>=20
> to conf/distro/include/angstrom.inc makes it go away. I'm not claiming
> its the correct fix, it just proves where the problem is.
>=20
> Secondly, the do_package task was depending on eglibc do_package. This
> is almost certainly due to the default dependencies on things like
> virtual/libc which we add. Being an "all" PACKAGE_ARCH, it clearly
> doesn't depend on this so adding INHIBIT_DEFAULT_DEPS =3D "1" to the
> update-rc.d recipe removed that problem and meant packaging didn't
> rerun.
>=20
> Further investigation is needed and these fixes need some thought and
> creation of proper patches but hopefully this gives a handle on whats
> going on and it turns out its not that hard to figure out (although =
some
> scripts to compare two such runs would be interesting and/or some =
proper
> test cases).
>=20
> Note that the DEPLOY_DIR_IMAGE[vardepsexclude] is not correct. The
> do_populate_lic task is putting files into the directory and the =
system
> is therefore totally correct in deciding that the task needed to rerun
> as the files were being placed in a different directory. =
do_populate_lic
> could likely use some work in that regard as I'm not sure this is the
> right place to be putting its data though.

Thanks for looking into this! For the time being I'll work around it =
with:

oen@dominion:/OE/tentacle/sources/meta-angstrom$ git diff conf/distro/
diff --git a/conf/distro/include/angstrom-core-tweaks.inc =
b/conf/distro/include/angstrom-core-tweaks.inc
index e4bd798..fe9225c 100644
--- a/conf/distro/include/angstrom-core-tweaks.inc
+++ b/conf/distro/include/angstrom-core-tweaks.inc
@@ -18,6 +18,11 @@ STAGING_DIR_HOST =3D =
"${STAGING_DIR}/${MACHINE}-${TCLIBC}"
+# Work around multimachine breakage
+# See =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/002535.htm=
l
+
+LICENSE_DIRECTORY =3D "${DEPLOY_DIR}/licenses"

I think that's a better place to stash those licenses, since we drop =
images in DEPLOY/image, sources in DEPLOY/sources and sdks in DEPLOY/sdk =
so DEPLOY/licenses makes sense.

Do you want me to send a patch to license.bbclass for this?

regards,

Koen=


