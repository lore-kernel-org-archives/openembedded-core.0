Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6A670F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:14:20 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id z60so8250354qgd.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 08:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NDv+EZPvHY8+mjUy/z7gLVeoZ43ZUnskiUorUe6Rgpo=;
	b=GUsuaihKhRiCOO337Eq3nqlP7RR8XYo+u4oVBXx4r5WAobmeDkqT0kpHksJupEVSR+
	AJr+YgHZZ3v12eJYCezXKBGU0Pl/aI/HO9v7cwRVtYWtA0IH2E2y7UBshpuGIkhv1Qva
	OqbKhY3tNhLT872PhX7KkUuAsPJZM9cvbLm7Q9M9szWWCZsYoMujuldIVxKPU9j4blfv
	3sah0BwaT1KXFW592TXmgXvEFOBLofp6GmU+oLBcpLq5sdatyqo7ulTi+IilOtBxrnPp
	C/PohyrBOqOBeR2q7jwNnkf6nthqN2l0R3AAmuKjvL+Qai1oCPOMhjR791xaDymyhJUy
	T/qQ==
X-Gm-Message-State: ALoCoQketLDbVOAaHbUa1jls4yzPMDW+6tMeRHUQ6vBLBn2Oy8w8eNKiPcdvM5jVSMQDsjnWwKYT
X-Received: by 10.224.103.65 with SMTP id j1mr68584746qao.17.1409757261687;
	Wed, 03 Sep 2014 08:14:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 3 Sep 2014 08:14:01 -0700 (PDT)
In-Reply-To: <1409663439-1725-2-git-send-email-georgex.l.musat@intel.com>
References: <1409663439-1725-1-git-send-email-georgex.l.musat@intel.com>
	<1409663439-1725-2-git-send-email-georgex.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Sep 2014 16:14:01 +0100
Message-ID: <CAJTo0LY333THMi1uvDjRpUd1MuP671CGikrSBCg_OoC8r_9BqQ@mail.gmail.com>
To: Lucian Musat <georgex.l.musat@intel.com>
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
X-List-Received-Date: Wed, 03 Sep 2014 15:14:30 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 14:10, Lucian Musat <georgex.l.musat@intel.com> wrote:
> +    @classmethod
> +    def tearDownClass(self):
> +        self.repo_server.stop()
> +        #remove created channels to be able to repeat the tests on same image
> +        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
> +        for x in result.split("\n"):
> +            if x not in self.existingchannels:
> +                oeRuntimeTest.tc.target.run('smart channel --remove '+x[1:-1]+' -y', 0)

If we're not removing the packages we've installed, why do we bother
removing the smart channels?

> +    @skipUnlessPassed('test_ssh')
> +    def test_ptestrunner(self):
> +        self.add_smart_channel()
> +        self.install_packages(self.install_complementary("*-ptest"))
> +        self.install_packages(['ptest-runner'])

Can't you check if the ptest IMAGE_FEATURE is enabled and if so, skip this?

> +        log_results_to_location = os.path.join('./results')

Joining a single item doesn't do anything.

> +        if not os.path.exists(log_results_to_location):
> +            os.makedirs(log_results_to_location)
> +
> +        # clear the results directory each time
> +        for path in os.listdir(log_results_to_location):
> +            os.remove(os.path.join(log_results_to_location, path))

I'd do something more like as it's a lot less lines and clear that
you're deleting the old tree and then creating a fresh one:

if os.path.exists(logdir):
  shutil.rmtree(logdir)
os.makedirs(logdir)


Ross

