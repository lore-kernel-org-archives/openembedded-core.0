Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A70F37732A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 16:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11G0C2Z003615; Wed, 1 Feb 2017 16:00:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OwXOw07owvUh; Wed,  1 Feb 2017 16:00:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v11G07Tu003611
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Feb 2017 16:00:08 GMT
Message-ID: <1485964807.14144.29.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2017 16:00:07 +0000
In-Reply-To: <c3a990d7-237d-e433-ae02-8bfe7214c162@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1485904618.14144.19.camel@linuxfoundation.org>
	<c3a990d7-237d-e433-ae02-8bfe7214c162@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] selftest/buildoptions: use a thinner image to test 'read-only-rootfs' feature
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
X-List-Received-Date: Wed, 01 Feb 2017 16:02:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-01 at 09:02 -0600, Leonardo Sandoval wrote:
> 
> On 01/31/2017 05:16 PM, Richard Purdie wrote:
> > 
> > On Tue, 2017-01-31 at 16:50 -0600,
> > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > 
> > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.c
> > > om>
> > > 
> > > The minimal is much faster to build that sato, so use the former
> > > to
> > > test
> > > read-only feature.
> > > 
> > > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linu
> > > x.in
> > > tel.com>
> > > ---
> > >   meta/lib/oeqa/selftest/buildoptions.py | 5 +----
> > >   1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> > > b/meta/lib/oeqa/selftest/buildoptions.py
> > > index d40eb00..004b2dd 100644
> > > --- a/meta/lib/oeqa/selftest/buildoptions.py
> > > +++ b/meta/lib/oeqa/selftest/buildoptions.py
> > > @@ -44,11 +44,8 @@ class ImageOptionsTests(oeSelfTest):
> > >   
> > >       @testcase(1435)
> > >       def test_read_only_image(self):
> > > -        distro_features = get_bb_var('DISTRO_FEATURES')
> > > -        if not ('x11' in distro_features and 'opengl' in
> > > distro_features):
> > > -            self.skipTest('core-image-sato requires x11 and
> > > opengl
> > > in distro features')
> > >           self.write_config('IMAGE_FEATURES += "read-only-
> > > rootfs"')
> > > -        bitbake("core-image-sato")
> > > +        bitbake("core-image-minimal")
> > >           # do_image will fail if there are any pending postinsts
> > Whilst this is certainly going to be a touch faster, I believe we
> > do
> > want to test read only rootfs with a larger image like sato to make
> > sure the postinsts really do work with a read only system?
> I don't get it. What would make the test different using a larger
> image?

The large image is more complex, it has more complex post-installs and
more utilities using update alternatives. The areas read-only rootfs
tends to break is in these areas as for example if certain postinstalls
get deferred to "on device at first boot", read-only rootfs breaks.

Cheers,

Richard



