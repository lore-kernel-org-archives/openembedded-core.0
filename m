Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA066B5AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 12:15:51 +0000 (UTC)
Message-ID: <520E17F6.4030500@communistcode.co.uk>
Date: Fri, 16 Aug 2013 13:15:50 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
In-Reply-To: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2013 12:15:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16/08/13 12:40, Laszlo Papp wrote:
> Hi,
> 
> alternatively: is there an option to turn gtk, especially the docs off?
> 
> Cheers,
> Laszlo
> 
> 

I don't know how to properly stop it building, or turn it off but I can
tell you the cause.

Running bitbake -g core-image-minimal outputs the dependency graphs, and
by examining that it seems as though the following packages pull in
gtk-doc related packages.

"connman" -> "gtk-doc-stub-native"
"kmod-native" -> "gtk-doc-stub-native"
"kmod" -> "gtk-doc-stub-native"
"glib-2.0" -> "gtk-doc-stub-native"
"glib-2.0-native" -> "gtk-doc-stub-native"

Now, all these packages are gtk-doc-stub[-native], which is described as:

DESCRIPTION = "Stub implementation of gtk-doc, as we don't want to build
the API documentation"

So it sounds like gtk-docs aren't actually being built, but the stubs
provide enough to make the package think they're being built...

That's all I know, someone with more gtk knowledge than me can probably
fill in the reason for why it's required to build those packages.

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambrideshire, UK
  http://www.embed.me.uk
--

