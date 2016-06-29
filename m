Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E8E91731C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 07:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5T7xT3f031691; Wed, 29 Jun 2016 08:59:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jUUBmn5h6Aqh; Wed, 29 Jun 2016 08:59:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5T7xQn8031687
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Jun 2016 08:59:27 +0100
Message-ID: <1467187166.8590.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Date: Wed, 29 Jun 2016 08:59:26 +0100
In-Reply-To: <CAJ86T=UbbVc+ZD8V4=_8jRa-2pwspmW3mpDV-JAVxzG=C4AX8A@mail.gmail.com>
References: <CAJ86T=UX4mrrftUtmnFX=Gv5JHXr0nFbh+qj7JOxbxFnKcfT9w@mail.gmail.com>
	<4011216.TxvZQ32zt2@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=UbbVc+ZD8V4=_8jRa-2pwspmW3mpDV-JAVxzG=C4AX8A@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Setting SRC_URI via anonymous Python fails in OE 2.1
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
X-List-Received-Date: Wed, 29 Jun 2016 07:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-29 at 00:40 -0700, Andre McCurdy wrote:
> On Tue, Jun 28, 2016 at 7:15 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > Hi Andre,
> > 
> > On Tue, 28 Jun 2016 15:53:24 Andre McCurdy wrote:
> > > The following works in OE 2.0, but fails in 2.1 and master:
> > > 
> > >   python () {
> > >       d.setVar("SRC_URI_FOO", "http://foo.com/foo.tgz")
> > >   }
> > > 
> > >   SRC_URI = "${SRC_URI_FOO}"
> > > 
> > > Is it a regression or was something like that never intended to
> > > work?
> > 
> > You didn't mention how it fails. However, I don't see any reason
> > why we
> > wouldn't want this to work, so if it does no longer work that seems
> > like a bug
> > to me.
> 
> The problem is that the intermediate variable doesn't seem to get
> expanded, so SRC_URI ends up containing the string "${SRC_URI_FOO}".
> 
> ERROR: /.../footest_0.1.bb: Error executing a python function in
> <code>:
> 
> The stack trace of python calls that resulted in this
> exception/failure was:
> File: '<code>', lineno: 1, function: <module>
>  *** 0001:__anon_651__home_andre_rdk_meta_classes_base_bbclass(d)
>      0002:__anon_1315__home_andre_rdk_meta_classes_insane_bbclass(d)
>      0003:__anon_242__home_andre_rdk_meta_classes_package_bbclass(d)
>     
>  0004:__anon_747__home_andre_rdk_meta_classes_package_rpm_bbclass(d)
>      0005:__anon_25__home_andre_rdk_meta_classes_debian_bbclass(d)
> 
> File: '/.../meta/classes/base.bbclass', lineno: 552, function:
> __anon_651__home_andre_rdk_meta_classes_base_bbclass
>      0548:    needsrcrev = False
>      0549:    srcuri = d.getVar('SRC_URI', True)
>      0550:    for uri in srcuri.split():
>      0551:        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
>  *** 0552:
>      0553:        # HTTP/FTP use the wget fetcher
>      0554:        if scheme in ("http", "https", "ftp"):
>      0555:            d.appendVarFlag('do_fetch', 'depends', '
> wget-native:do_populate_sysroot')
>      0556:
> 
> File: '/.../bitbake/lib/bb/fetch2/__init__.py', lineno: 360,
> function: decodeurl
>      0356:    """
>      0357:
>      0358:    m =
> re.compile('(?P<type>[^:]*)
> ://((?P<user>[^/]+)@)?(?P<location>[^;]+)(;(?P<parm>.*))?').match(url
> )
>      0359:    if not m:
>  *** 0360:        raise MalformedUrl(url)
>      0361:
>      0362:    type = m.group('type')
>      0363:    location = m.group('location')
>      0364:    if not location:
> 
> Exception: bb.fetch2.MalformedUrl: The URL: '${SRC_URI_FOO}' is
> invalid and cannot be interpreted
> 
> ERROR: Failed to parse recipe: /.../footest_0.1.bb

I'm just guessing but this sounds like an anonymous python ordering
issue. The error above looks to be coming from the anonymous python in
base.bbclass and its depending on the anonymous python in your recipe
having run first. There are no order guarantees about anonymous python.

[As an aside, bitbake simply collects up a list of anonymous python
functions and then calls them all at the end of parsing. Its possible
python3 is being a bit more interesting about the ordering of that
list, or it could be something else]

This is something we likely need to look into from a determinism
perspective but its also a hard problem...

Cheers,

Richard






