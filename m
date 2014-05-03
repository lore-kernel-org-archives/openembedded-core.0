Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F03A26098B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 09:08:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4398GnL004449; Sat, 3 May 2014 10:08:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hUKZc01nYKRU; Sat,  3 May 2014 10:08:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4398EMV004444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 3 May 2014 10:08:15 +0100
Message-ID: <1399108088.12731.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 03 May 2014 10:08:08 +0100
In-Reply-To: <CAJTo0Lbb_D7+SOMuPE5fKY52mnHuw=s3Y_0LxOzwsQTQcKsYXg@mail.gmail.com>
References: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
	<1399066445.12731.86.camel@ted>
	<CANyK_8eUuUqAMf87-pSVdd7X5_BTXOn7iQCdQ0XYyTjxu=PKbA@mail.gmail.com>
	<1399068428.12731.88.camel@ted>
	<CAJTo0Lbb_D7+SOMuPE5fKY52mnHuw=s3Y_0LxOzwsQTQcKsYXg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ensuring a task is re-ran when local.conf is updated
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
X-List-Received-Date: Sat, 03 May 2014 09:08:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-05-03 at 10:03 +0100, Burton, Ross wrote:
> On 2 May 2014 23:07, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > It may well do and I've realised the issue:
> >
> > codeparser.py:
> > class PythonParser():
> >     getvars = ("d.getVar", "bb.data.getVar", "data.getVar", "d.appendVar", "d.prependVar")
> >
> > we probably need to change this to an .endswith(".getVar", ".appendVar",
> > ".prependVar") type check...
> 
> Could this be the root-cause of so many instances where we've had to
> add explicit hints that variables should be added to the hash?

Is there really "so many"?

In each case we've seen its been due to the code being python that the
parser can't expand. A simple example that trips it up:

a = "FOO"
d.getVar(a)

We've only added in fixups where the missing variables were adequately
explained. The other set of things we manually tune are exclusions since
there are some variables like the build path that we want to actively
exclude.

However the majority of the accesses we make are simple and the parser
can find them...

Cheers,

Richard



