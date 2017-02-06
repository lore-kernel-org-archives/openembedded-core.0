Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 88D53600E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:55:25 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:c5f6:564a:5bbc:a813] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1camZX-0001EW-J0; Mon, 06 Feb 2017 17:55:25 +0100
Message-ID: <1486400123.22715.15.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Feb 2017 16:55:23 +0000
In-Reply-To: <1486392281.22715.7.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
	<1486388525.22715.2.camel@pbcl.net>
	<1486391230.14144.82.camel@linuxfoundation.org>
	<1486392281.22715.7.camel@pbcl.net>
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
X-List-Received-Date: Mon, 06 Feb 2017 16:55:25 -0000
Content-Type: multipart/alternative; boundary="=-SmaeFbkeXESS0Hhgk/lJ"

--=-SmaeFbkeXESS0Hhgk/lJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-06 at 14:44 +0000, Phil Blundell wrote:
> But sadly the contents of libecj-bootstrap-native doesn't actually
> show up in gnujaf-native's recipe-sysroot-native.

A bit of further sleuthing reveals that although this problem only
started with rss the blame lies somewhere else.  It transpires that
meta-java's java-library.bbclass contains the somewhat epically
unhelpful (in this context) fragment:

# Java "source" distributions often contain precompiled things
# we want to delete first.
do_removebinaries() {
  find ${WORKDIR} -name "*.jar" -exec rm {} \;
  find ${WORKDIR} -name "*.class" -exec rm {} \;
}

addtask removebinaries after do_unpack before do_patch

And, since recipe-sysroot-native is inside ${WORKDIR}, this blows away
everything that rss carefully placed there.  Doh.

p.

--=-SmaeFbkeXESS0Hhgk/lJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Mon, 2017-02-06 at 14:44 +0000, Phil Blund=
ell wrote:</div><blockquote type=3D"cite"><div>But sadly the contents of li=
becj-bootstrap-native doesn't actually show up in gnujaf-native's recipe-sy=
sroot-native.</div></blockquote><div><br></div><div>A bit of further sleuth=
ing reveals that although this problem only started with rss the blame lies=
 somewhere else.  It transpires that meta-java's java-library.bbclass conta=
ins the somewhat epically unhelpful (in this context) fragment:</div><div><=
br></div><div># Java "source" distributions often contain precompiled thing=
s</div><div># we want to delete first.</div><div>do_removebinaries() {</div=
><div>&nbsp; find ${WORKDIR} -name "*.jar" -exec rm {} \;</div><div>&nbsp; =
find ${WORKDIR} -name "*.class" -exec rm {} \;</div><div>}</div><div><br></=
div><div>addtask removebinaries after do_unpack before do_patch</div><div><=
br></div><div>And, since recipe-sysroot-native is inside ${WORKDIR}, this b=
lows away everything that rss carefully placed there.  Doh.</div><div><br><=
/div><div>p.</div><div><br></div><div></div></body></html>

--=-SmaeFbkeXESS0Hhgk/lJ--
