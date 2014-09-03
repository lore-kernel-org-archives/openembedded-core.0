Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 11769713E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 22:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s83MAnc5002035; Wed, 3 Sep 2014 23:10:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1YeCBQeL9FYb; Wed,  3 Sep 2014 23:10:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s83MAkXW002029
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 3 Sep 2014 23:10:47 +0100
Message-ID: <1409782248.12482.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 03 Sep 2014 23:10:48 +0100
In-Reply-To: <CAJTo0LY333THMi1uvDjRpUd1MuP671CGikrSBCg_OoC8r_9BqQ@mail.gmail.com>
References: <1409663439-1725-1-git-send-email-georgex.l.musat@intel.com>
	<1409663439-1725-2-git-send-email-georgex.l.musat@intel.com>
	<CAJTo0LY333THMi1uvDjRpUd1MuP671CGikrSBCg_OoC8r_9BqQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/runtime: Automatic test for ptest
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
X-List-Received-Date: Wed, 03 Sep 2014 22:10:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-03 at 16:14 +0100, Burton, Ross wrote:
> On 2 September 2014 14:10, Lucian Musat <georgex.l.musat@intel.com> wrote:
> > +    @classmethod
> > +    def tearDownClass(self):
> > +        self.repo_server.stop()
> > +        #remove created channels to be able to repeat the tests on same image
> > +        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
> > +        for x in result.split("\n"):
> > +            if x not in self.existingchannels:
> > +                oeRuntimeTest.tc.target.run('smart channel --remove '+x[1:-1]+' -y', 0)
> 
> If we're not removing the packages we've installed, why do we bother
> removing the smart channels?
> 
> > +    @skipUnlessPassed('test_ssh')
> > +    def test_ptestrunner(self):
> > +        self.add_smart_channel()
> > +        self.install_packages(self.install_complementary("*-ptest"))
> > +        self.install_packages(['ptest-runner'])
> 
> Can't you check if the ptest IMAGE_FEATURE is enabled and if so, skip this?

Also, this is smart specific so we probably need an "isRPM?" type check
somewhere in this test (or use librbary functions and have support for
other package backends but that is something for another patch series
sometime).

Cheers,

Richard

> > +        log_results_to_location = os.path.join('./results')
> 
> Joining a single item doesn't do anything.
> 
> > +        if not os.path.exists(log_results_to_location):
> > +            os.makedirs(log_results_to_location)
> > +
> > +        # clear the results directory each time
> > +        for path in os.listdir(log_results_to_location):
> > +            os.remove(os.path.join(log_results_to_location, path))
> 
> I'd do something more like as it's a lot less lines and clear that
> you're deleting the old tree and then creating a fresh one:
> 
> if os.path.exists(logdir):
>   shutil.rmtree(logdir)
> os.makedirs(logdir)
> 
> 
> Ross



