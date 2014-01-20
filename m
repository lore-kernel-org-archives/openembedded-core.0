Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BC17E6186D;
	Mon, 20 Jan 2014 23:57:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0KNqr3W028230; Mon, 20 Jan 2014 23:56:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aEqaIFsI_LeG; Mon, 20 Jan 2014 23:56:57 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0KNuYfx028268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 20 Jan 2014 23:56:36 GMT
Message-ID: <1390262187.874.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Mon, 20 Jan 2014 23:56:27 +0000
In-Reply-To: <1390242540.3441.36.camel@dvhart-mobl4.amr.corp.intel.com>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>
	<1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
	<52D62433.8020402@windriver.com> <20140115103059.GH3717@jama>
	<CANR6C55w4BGDQadD5+Udv=2ae6nBUZiO8UdfVnFdSDkHGb2L9w@mail.gmail.com>
	<1390242540.3441.36.camel@dvhart-mobl4.amr.corp.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Mon, 20 Jan 2014 23:57:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-20 at 10:29 -0800, Darren Hart wrote:
> Reverting the patch allows me to move forward, but yes, I'm surprised we
> aren't seeing more build failures.... I wonder what makes us special?

For some reason I still don't have the email I can see you sent from the
list archives. What is interesting is that:

a) you have gcc 4.6, I have gcc 4.8
b) the error appears to come from error.h in SCM_NORETURN definitions
c) the config log for autogen shows different results for
   "checking for working stdnoreturn.h", yes in my case, no in yours.

The definition of SCM_NORETURN is from __scm.h:
 
#define SCM_NORETURN __attribute__ ((noreturn))

and the dummy stdnoreturn.h that autogen would generate does:

#define noreturn _Noreturn

and then _Noreturn.h defines:

#  define _Noreturn __attribute__ ((__noreturn__))

so I think what is happening is there is double macro overlap with

#define SCM_NORETURN __attribute__ ((noreturn))

becoming

#define SCM_NORETURN __attribute__ ((__attribute__ ((__noreturn__))))

How we fix it I have no idea. We should check and see if someone fixed
this upstream to start with. Robert, now we know what to look for, can
you help?

Cheers,

Richard


