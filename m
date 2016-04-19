Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF852602D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 18:02:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3JI2NvP029577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 11:02:23 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 11:02:22 -0700
To: <openembedded-core@lists.openembedded.org>
References: <57166561.7020006@enea.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <571672AD.9060706@windriver.com>
Date: Tue, 19 Apr 2016 13:02:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <57166561.7020006@enea.com>
Subject: Re: rpm generation question
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
X-List-Received-Date: Tue, 19 Apr 2016 18:02:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/19/16 12:05 PM, Tudor Florea wrote:
> As part of our test infrastructure we're attempting to install ptest
> packages (and execute the tests accordingly).
> Attempting to install ptest for valgrind fails with this error:
> 
> error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
> provides /this/is/a/bogus/interpreter/name

You can turn off the file level requires and provides on a per package basis.

SKIP_FILEDEPS_${PN}-ptest = '1'

Otherwise (for rpm packages) the system will attempt to discover and use the
per-file interpreter and other dependencies.  Since ptest is only tests, and the
dependencies here are specific to tests -- it should be safe to disable them.

(If that isn't the right approach for some reason, there are some other ways to
do a file level provide, but they're significantly more complicated and rarely
used.)

--Mark

> 
> smart install valgrind-ptest-3.11.0-r0.1@ppce500mc
> Loading cache...
> Updating cache...
> ###############################################################################
> [100%]
> 
> Computing transaction...
> 
>  error: Can't install valgrind-ptest-3.11.0-r0.1@ppce500mc: no package
> provides /this/is/a/bogus/interpreter/name
> 
> 
> This is most probably caused by the file shell_badinterp contained in
> this package having the following contents:
> 
> #! /this/is/a/bogus/interpreter/name
> 
> true
> 
> Does anyone have an idea how to get rid of this error?
> More specific: How can I exclude dependency on
> "/this/is/a/bogus/interpreter/name" for an rpm package?
> 
> Thank you very much.
>   Tudor.
> 


