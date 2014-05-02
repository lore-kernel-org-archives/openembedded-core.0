Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9A011601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 22:07:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s42M7HMR024259; Fri, 2 May 2014 23:07:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Vp-253mbKxmU; Fri,  2 May 2014 23:07:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s42M7EaD024255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 2 May 2014 23:07:15 +0100
Message-ID: <1399068428.12731.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 02 May 2014 23:07:08 +0100
In-Reply-To: <CANyK_8eUuUqAMf87-pSVdd7X5_BTXOn7iQCdQ0XYyTjxu=PKbA@mail.gmail.com>
References: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
	<1399066445.12731.86.camel@ted>
	<CANyK_8eUuUqAMf87-pSVdd7X5_BTXOn7iQCdQ0XYyTjxu=PKbA@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 May 2014 22:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-05-02 at 22:51 +0100, Paul Barker wrote:
> On 2 May 2014 22:34, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2014-05-02 at 17:43 +0100, Paul Barker wrote:
> >>
> >> Am I missing something here? Is it expected that this variable change
> >> is detected and the relevant tasks re-executed? I know changing
> >> variables like PREFERRED_PROVIDER_* in local.conf causes things to be
> >> rebuilt, so why does that work and this not?
> >
> > This should work, I'm not sure why it wouldn't. The code should be able
> > to detect the dependency on the IPK_HIERARCHICAL_FEED variable and
> > notice when the value changes.
> >
> > I'd have to experiment with some builds to figure out anything further
> > but its probably worth opening a bug report as it sounds broken.
> >
> > bitbake-dffsigs on a siginfo file of a do_package_write_ipk is where to
> > start with debugging, it should show the dependency on the variable.
> 
> Looks like I found the issue quickly using bitbake-diffsigs.
> do_package_write_ipk does:
>     localdata = bb.data.createCopy(d)
> Then uses localdata.
> 
> If I check localdata.getVar(), the variable name doesn't appear in the
> list of dependencies.
> 
> If instead I check d.getVar(), it does appear in the list of dependencies.
> 
> It looks like localdata is used so that certain variables can be set
> without the changes affecting anything else (PKG, OVERRIDES, ROOT,
> etc). But there are also some calls to localdata.getVar() for
> PACKAGE_ARCH and ALLOW_EMPTY.
> 
> With my check changed to d.getVar(), the dependencies are: (['PKGE',
> 'IPK_HIERARCHICAL_FEED', 'get_package_additional_metadata',
> 'PKGWRITEDIRIPK', 'OPKGBUILDCMD', 'mapping_rename_hook', 'PKGDEST',
> 'PACKAGES', 'HOMEPAGE'])
> 
> Does this mean changes to PACKAGE_ARCH and ALLOW_EMPTY may go unnoticed?

It may well do and I've realised the issue:

codeparser.py:
class PythonParser():
    getvars = ("d.getVar", "bb.data.getVar", "data.getVar", "d.appendVar", "d.prependVar")

we probably need to change this to an .endswith(".getVar", ".appendVar",
".prependVar") type check...

Cheers,

Richard


