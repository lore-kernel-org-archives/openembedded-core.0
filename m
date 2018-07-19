Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC6178A81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 12:47:58 +0000 (UTC)
Received: from [10.1.14.230] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id E73E5F08;
	Thu, 19 Jul 2018 14:47:58 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
	<1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
	<20180719121252.GB1436@jama>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <bfaa505c-1ffe-3c22-e0f3-9a06f4fab4bc@pseudoterminal.org>
Date: Thu, 19 Jul 2018 14:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719121252.GB1436@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 12:47:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2018-07-19 14:12, Martin Jansa wrote:
> On Thu, Jul 19, 2018 at 01:16:51PM +0200, Carlos Rafael Giani wrote:
>> As a general rule, I think adding packageconfigs to an oe-core recipe
>> that has dependencies outside of oe-core and meta-openembedded is
>> questionable. Take the qt5 packageconfig for example. It is *not* part
>> of gstreamer1.0-plugins-good in oe-core, and for good reason - it needs
>> extra switches for passing paths to moc, uic etc.
> I don't see what's questionable with that. PACKAGECONFIG is just a way
> to pass configure options like EXTRA_OECONF just with benefit that it's
> easily switched from outside and that it encapsulates build time and
> runtime dependencies together with the options.
>
>> Now, what if a recipe outside of oe-core and meta-openembedded is just
>> like that? It needs its own customizations, its own switches. It would
>> be better off setting up its own packageconfig, just like what that
>> bbappend in meta-qt5 does.
> If someone submits PACKAGECONFIG addition for something which only
> exists in his own layer, I'm fine with that, why should we make it
> harder for people to use oe-core or meta-oe recipes?

Adding a .bbappend that adds the packageconfig does not sound hard to 
me. However, having packageconfigs whose dependencies may or may not be 
dead (because of the layer being dead) sounds more like a maintenance 
problem.

> No I don't like that meta-qt5 has to use own bbappend for gstreamer,
> it's necessary in this case because of the paths as you sad, but also
> causes:
> https://github.com/meta-qt5/meta-qt5/commit/73f99f2370a3dc5b81f42d0af7fe530431599454
> which is quite annoying for meta-qt5 users, because this is one of very
> few reasons why different meta-qt5 version isn't compatible with
> different oe-core. So in order to use Qt 5.11 with oe-core from morty, I
> need to BBMASK this bbappend and create the old one for
> gstreamer1.0-plugins-bad in our project layer, it would be much nicer
> and less error prone with PACKAGECONFIG directly in oe-core.

Agreed. This is a drawback. Unavoidable in this case, unfortunately.

> Also if you look at EXTRA_OECONF you'll see either --disable-qt twice or
> --disable-qt followed by --enable-qt (when we depend on configure to let
> the last option on command line win) which isn't ideal as well and might
> confuse people looking at the log.do_configure.

Hmm perhaps a bit, but the order matters, so I know that the last one 
"wins". Multiple switches like that are not uncommon in automated build 
environments, so I am used to seeing these.


>> I suppose with libvisual such a central packageconfig would work, but
>> isn't the whole idea of oe-core to be lean? And yet, now we start adding
>> more and more packageconfigs even though the recipes are in some other
>> layers that are not part of the central ones (oe-core and
>> meta-openembedded)?
> Yes it's supposed to be lean as in number of recipes it needs to carry,
> not lean by number of lines (PACKAGECONFIG is 1 line exactly as the
> --diable flag in EXTRA_OECONF) or lean in number of ways how people are
> able to use it.
>
> Why should meta-openembedded have special status for PACKAGECONFIGs
> anyway, if you want to make it harder to customize the build, why stop
> there?

meta-openembedded isn't tied to any particular platform, BSP, distro, 
environment. It does have a special place, since it is a central layer 
for many setups. How many BSP layers, distro layers etc. list both 
oe-core and meta-openembedded as dependency, for example? meta-debian 
and meta-qt5-extra however do not have nearly the same status (and these 
are the places where libvisual is).


>> You might as well add dozens of packageconfigs to
>> gstreamer1.0-plugins-bad, just in case some obscure layer adds a recipe
>> for OpenEXR or spandsp for example.
> Yes, that's exactly what I often do, last time e.g. with libdrm
> http://git.openembedded.org/openembedded-core/commit/?id=dc7d3b2ff79ae324b96a51ec1be557a432ed351d
> and e.g. qemu before that, adding PACKAGECONFIG for dependencies which
> I haven't submitted to meta-networking yet at that time:
> http://git.openembedded.org/openembedded-core/commit/?id=ebb6ef1dbc7e03a4b7030b3056bd0fa59fdd047b
> and I haven't submitted the recipe for virglrenderer yet as well and
> I don't see any issue with having the PACKAGECONFIG for it already.
>

Eh, I don't think I can agree with that approach. Having an openexr 
packageconfig for example implies that this packageconfig is actually 
usable and gstreamer1.0-plugins-bad can be built with it enabled. But 
adding it without an openexr dependency? Sounds broken to me. This is 
why I prefer to keep such features disabled until there is a recipe for 
them in meta-openembedded.

