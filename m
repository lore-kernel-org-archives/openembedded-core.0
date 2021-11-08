Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <5c4566d9e3e395595562d0c2e10707fd7c71ea8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [V3][PATCH] ruby: workaround ptest hang problem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Mon, 08 Nov 2021 10:46:52 +0000
In-Reply-To: <f45b132a-b8c5-1d74-3008-dd79aa888153@windriver.com>
References: <20211105021848.6807-1-changqing.li@windriver.com>
	 <69bc0138e89d4f77b6062e451dc6fd81e48becbc.camel@linuxfoundation.org>
	 <f45b132a-b8c5-1d74-3008-dd79aa888153@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Changqing Li <changqing.li@windriver.com>, openembedded-core@lists.openembedded.org

On Mon, 2021-11-08 at 12:02 +0800, Changqing Li wrote:
> On 11/6/21 5:27 PM, Richard Purdie wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > 
> > On Fri, 2021-11-05 at 10:18 +0800, Changqing Li wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > since openssl 3 not compatible problem, ruby have disable openssl
> > > extention. But disable openssl extention make test_smtp.rs hang at
> > > test case "test_start".
> > > 
> > > Net::TestSMTP#test_start:
> > > NameError: uninitialized constant Net::SMTP::OpenSSL
> > > Did you mean? Open3
> > > /usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context'
> > > /usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'
> > > /usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'
> > > /usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start'
> > > 
> > > temporarily remove the hang case to make other testcases can be run.
> > > 
> > > Meantime, move ruby-ptest out of the PTESTS_PROBLEMS list.
> > > On 48 core host, run ruby ptest in qemux86-64:
> > > root@qemux86-64:/usr/lib64/ruby/ptest# time ./run-ptest
> > > PASS: test/test_set.rb
> > > PASS: test/stringio/test_stringio.rb
> > > ...
> > > PASS: test/did_you_mean/test_tree_spell_checker.rb
> > > PASS: test/test_mutex_m.rb
> > > 
> > > real  5m42.872s
> > > user  3m50.923s
> > > sys   0m44.136s
> > > 
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >   meta/conf/distro/include/ptest-packagelists.inc | 3 +--
> > >   meta/recipes-devtools/ruby/ruby.inc             | 4 ++++
> > >   2 files changed, 5 insertions(+), 2 deletions(-)
> > Unfortunately the success rate isn't like that when we tried this on the
> > autobuilder, it failed on both arm64 and x86_64 with multiple failures:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2791
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2507
> 
> Sorry,  I thought this is expected.  Ruby have 800+ test cases, and 
> failed about
> 
> 30+ all the time.  so I think we still need to put ruby ptest in the  
> PTESTS_PROBLEMS list until
> 
> we address all the failed cases.

What we could do is mask out the failing cases. The issue is that we'll see
warnings on the autobuilder for cases that fail so we need to remove any "known
to fail" cases before we can enable by default there.

Cheers,

Richard

