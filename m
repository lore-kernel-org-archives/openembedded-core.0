Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E488E719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 13:42:09 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:c5f6:564a:5bbc:a813] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cajYT-0000rl-SJ; Mon, 06 Feb 2017 14:42:09 +0100
Message-ID: <1486388525.22715.2.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Feb 2017 13:42:05 +0000
In-Reply-To: <1486124973.13882.29.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: RSS difficulties
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
X-List-Received-Date: Mon, 06 Feb 2017 13:42:12 -0000
Content-Type: multipart/alternative; boundary="=-MD+aI8dvfqrQZPYXyXxU"

--=-MD+aI8dvfqrQZPYXyXxU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-02-03 at 12:29 +0000, Phil Blundell wrote:
> Ah, right, thanks.  The particular piece of magic I was missing was:
> 
>             # Nothing need depend on libc-initial/gcc-cross-initial
>             if "-initial" in taskdependees[task][0]:
>                 continue
> 
> which I think explains all the difficulties I was having.

Actually, that explains most of my difficulties but not all of them. 
The remaining ones seem to come down to missing dependencies but I am
not quite clear on why the dependencies are missing.

The problematic recipes are Java ones.  The Java toolchain, as you
might expect, has a fairly complicated dependency tree but essentially:

- any Java package has DEPENDS = "virtual/javac-native", which is
PROVIDEd by ecj-bootstrap-native.bb

- ecj-bootstrap-native.bb is basically just a wrapper script which runs
the Java compiler.  The actual compiler implementation is in libecj-
bootstrap-native.bb and ecj-bootstrap-native.bb RDEPENDS on that.

If I run "bitbake -D -D ..." then I see:

DEBUG: Added runtime dependencies ['libecj-bootstrap-native'] for
.../meta-java/recipes-core/ecj/ecj-bootstrap-native.bb

but this dependency edge doesn't show up in task-depends.dot and, sure
enough, libecj-bootstrap-native isn't getting installed into the
recipe-sysroot. 

Is there some other piece of logic that is squashing these
dependencies?  Or is there somewhere else that I ought to be looking
for them?

thanks

p.

--=-MD+aI8dvfqrQZPYXyXxU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2017-02-03 at 12:29 +0000, Phil Blund=
ell wrote:</div><blockquote type=3D"cite"><div>Ah, right, thanks.&nbsp;&nbs=
p;The particular piece of magic I was missing was:</div><div><br></div><div=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
Nothing need depend on libc-initial/gcc-cross-initial</div><div>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if "-initial" =
in taskdependees[task][0]:</div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;continue</div><di=
v><br></div><div>which I think explains all the difficulties I was having.<=
/div></blockquote><div><br></div><div>Actually, that explains most of my di=
fficulties but not all of them.  The remaining ones seem to come down to mi=
ssing dependencies but I am not quite clear on why the dependencies are mis=
sing.</div><div><br></div><div>The problematic recipes are Java ones.  The =
Java toolchain, as you might expect, has a fairly complicated dependency tr=
ee but essentially:</div><div><br></div><div>- any Java package has DEPENDS=
 =3D "virtual/javac-native", which is PROVIDEd by ecj-bootstrap-native.bb</=
div><div><br></div><div>- ecj-bootstrap-native.bb is basically just a wrapp=
er script which runs the Java compiler.  The actual compiler implementation=
 is in libecj-bootstrap-native.bb and ecj-bootstrap-native.bb RDEPENDS on t=
hat.</div><div><br></div><div>If I run "bitbake -D -D ..." then I see:</div=
><div><br></div><div>DEBUG: Added runtime dependencies ['libecj-bootstrap-n=
ative'] for .../meta-java/recipes-core/ecj/ecj-bootstrap-native.bb</div><di=
v><br></div><div>but this dependency edge doesn't show up in task-depends.d=
ot and, sure enough, libecj-bootstrap-native isn't getting installed into t=
he recipe-sysroot. </div><div><br></div><div>Is there some other piece of l=
ogic that is squashing these dependencies?  Or is there somewhere else that=
 I ought to be looking for them?</div><div><br></div><div>thanks</div><div>=
<br></div><div>p.</div><div><br></div><div></div></body></html>

--=-MD+aI8dvfqrQZPYXyXxU--
