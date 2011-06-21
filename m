Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZ8cb-0007mK-Cm
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:36:33 +0200
Received: by wwi18 with SMTP id 18so673000wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:32:59 -0700 (PDT)
Received: by 10.217.7.6 with SMTP id z6mr71679wes.57.1308691979622;
	Tue, 21 Jun 2011 14:32:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm3710767weq.27.2011.06.21.14.32.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 14:32:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E00ED2C.1040708@windriver.com>
Date: Tue, 21 Jun 2011 23:32:53 +0200
Message-Id: <7E1967A9-8BDC-4B6D-85FB-0232590DD15A@dominion.thruhere.net>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 21:36:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 21:12 heeft Mark Hatle het volgende geschreven:

> On 6/21/11 1:57 PM, Phil Blundell wrote:
>> On Tue, 2011-06-21 at 11:43 -0500, Mark Hatle wrote:
>>> Adjust the umask to 022.  This resolves the problem of dynamically =
generated
>>> directories (mkdir -p) and specific files (touch foo) having odd =
permissions.
>>>=20
>>> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmhatle/=
perms&id=3Dd8470b6a8efdbba04cef5d4dc1ce12720fe83621
>>=20
>> Are you confident that this isn't going to break anything like
>> group-shared DL_DIRs?  I'm not entirely thrilled about forcing the =
umask
>> to 022 for everything that bitbake does, although I can see that =
making
>> it be so for particular tasks like do_install() might have some =
merit.
>> Even in the latter case, though, I wonder whether we should just be
>> paying more attention to recipe hygiene and using "install -m ..." =
with
>> the permissions that we actually want.
>=20
> This is why I bring this up.. I'm a bit concerned that doing it =
generally will
> have unintended consequences.  So far I am not aware of any.  Moving =
it to a
> different place in the process may be better.  The only issue I've =
found so far
> is that just coding int into "do_install" really isn't an option.  =
Between the
> custom do_install components, various classes, etc.. it's difficult in =
the
> current infrastructure to find a centralized location to set the =
value.

Would something like this work?

myclass.bbclass:

addtask mytask before do_package after do_install

mytask() {
	do stuff
}

DISTRO.conf:

# do stuff
INHERIT +=3D "myclass"

regards,

Koen
=09=


