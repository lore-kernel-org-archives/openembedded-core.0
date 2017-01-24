Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BB20F719DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 22:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0OM8qYR012229; Tue, 24 Jan 2017 22:08:52 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SBAhJ3Dm_tIt; Tue, 24 Jan 2017 22:08:52 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0OM8lIT012222
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Jan 2017 22:08:48 GMT
Message-ID: <1485295727.30673.69.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 22:08:47 +0000
In-Reply-To: <5ac6e942-a4af-b333-b8f2-45655548915d@gmail.com>
References: <6e2081903352fbfbc818384ce44dc58c3da507e3.1485265775.git.maciej.borzecki@rndity.com>
	<5ac6e942-a4af-b333-b8f2-45655548915d@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] staging: fix logic of guessing dependency manifest file in extend_recipe_sysroot
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
X-List-Received-Date: Tue, 24 Jan 2017 22:08:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-24 at 14:05 -0800, Khem Raj wrote:
> 
> On 1/24/17 5:50 AM, Maciej Borzecki wrote:
> > 
> > Recipe sysroots introduced a change where dependencies ending with
> > "-cross" also
> > count as native tools and (see setscene_depvalid() for details).
> > 
> > The same logic was missing from extend_recipe_sysroot(), hence for
> > depency named
> > `go-cross` the manifest file would default to
> > `manifest-allarch-go-cross.populate_sysroot`, while the correct
> > name is
> > `manifest-x86_64_arm-go-cross.populate_sysroot`
> > 
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> > ---
> >  meta/classes/staging.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/staging.bbclass
> > b/meta/classes/staging.bbclass
> > index
> > fc387eaf4bb52971e111ae7deac7d7d6fc389337..efea450e4f73661366d0929d5
> > c39e42bfe9f8e8b 100644
> > --- a/meta/classes/staging.bbclass
> > +++ b/meta/classes/staging.bbclass
> > @@ -521,7 +521,7 @@ python extend_recipe_sysroot() {
> >              native = True
> >          elif c.startswith("nativesdk-"):
> >              manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-
> > ${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
> > -        elif "-cross-" in c:
> > +        elif "-cross-" in c or c.endswith("-cross"):
> Perhaps you can change the go cross recipe to use something like
> 
> PN = "go-cross-${TARGET_ARCH}"
> 
> > 
> >              manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-
> > ${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot" % c)
> >              native = True
> >          elif "-crosssdk" in c:
> > 

FWIW the patch as it stands is going to cause problems since for
example qemuwrapper-cross doesn't inherit cross.bbclass (nor should it)
and will fail the manifest tests if we change it to include *-cross :(

Cheers,

Richard


