Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <a8c110ca-bc07-dfe7-329e-5a1a8247ef8b@gmail.com>
Date: Fri, 24 Sep 2021 09:22:03 -0700
MIME-Version: 1.0
Subject: Re: user/group XXX does not exist, using root with RPM/DNF packaging in Hardknott and Honister
References: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
In-Reply-To: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>, openembedded-core@lists.openembedded.org



On 9/24/21 7:02 AM, Böszörményi Zoltán wrote:
> Hi,
> 
> I have a special package that creates users and groups
> via inherit useradd. This package doesn't depend on any
> others but it is depended on, both via DEPENDS and RDEPENDS
> by packages using those users/groups in their do_install
> scripts.
> 
> This works for packaging becase these ownerships
> are encoded in the packages, confirmed by rpm -qp --dump ...
> 
> However, during do_rootfs, a couple of
> "user/group XXX does not exist, using root"
> messages appear for the packages depending on others
> creating these users/groups.
> 
> log.do_rootfs shows that the package installation ordering
> does not follow RDEPENDS. Instead, it's practically an
> alphabetical order when running dnf.
> 
> This doesn't just involve my custom packages, but also clamav
> plus another one in which I ship a small limited set of
> virus signatures, also chown'd to clamav and with RDEPENDS
> on clamav.
> 
> What is the correct solution to this?

You can define it via conf metadata e.g.

INHERIT += "extrausers"


EXTRA_USERS_PARAMS += "\
     useradd foo; \
     usermod -p 'XXXX' foo; \
     usermod -a -G adm foo; \
     usermod -a -G video foo; \
     usermod -a -G audio foo; \
     usermod -a -G systemd-journal foo; \
"


> 
> Thanks in advance,
> Zoltán Böszörményi
