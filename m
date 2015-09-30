Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1324077065
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 16:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UG03rm016010; Wed, 30 Sep 2015 17:00:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rBzowIWdMf06; Wed, 30 Sep 2015 17:00:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UFxlSM015984
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Sep 2015 16:59:58 +0100
Message-ID: <1443628787.5162.122.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Sep 2015 16:59:47 +0100
In-Reply-To: <20150930142859.GB2405@jama>
References: <1443620833.5162.83.camel@linuxfoundation.org>
	<20150930142859.GB2405@jama>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-selftest: Add qemux86copy machine
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
X-List-Received-Date: Wed, 30 Sep 2015 16:00:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-30 at 16:28 +0200, Martin Jansa wrote:
> On Wed, Sep 30, 2015 at 02:47:13PM +0100, Richard Purdie wrote:
> > I know Martin finds something like this useful for testing sstate signatures,
> > this adds one to meta-selftest so we can use it from oe-selftest in the sstate
> > tests there too.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta-selftest/conf/machine/qemux86copy.conf b/meta-selftest/conf/machine/qemux86copy.conf
> > new file mode 100644
> > index 0000000..bcce2f5
> > --- /dev/null
> > +++ b/meta-selftest/conf/machine/qemux86copy.conf
> > @@ -0,0 +1,3 @@
> > +require conf/machine/qemux86.conf
> > +
> > +MACHINEOVERRIDES .= ":qemux86"
> 
> I wasn't changing MACHINEOVERRIDES (in case this would hide some
> possible sstate differences),

I think this actually makes it more likely to highlight differences, but
either way, the tests I ran did highlight a raft of issues and it seems
to be good enough to find several problems. I've sent enough fixes to
make the new selftest pass.

>  instead I had to duplicate couple qemux86
> overrides in linux-yocto, but this is still useful.
> 
> I'll drop my version after testing with sstate-diff-machines.sh that
> both return the same results.

Sounds good.

FWIW you can run the new test with:

oe-selftest --run-tests sstatetests.SStateTests.test_sstate_sametune_samesigs

in case that isn't clear. It doesn't rely on building anything so is
comparatively fast.

Cheers,

Richard




