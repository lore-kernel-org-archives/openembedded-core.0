Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9AC6B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 08:40:37 +0000 (UTC)
Message-ID: <52147D02.10106@communistcode.co.uk>
Date: Wed, 21 Aug 2013 09:40:34 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
In-Reply-To: <CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Aug 2013 08:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21/08/13 08:55, Laszlo Papp wrote:
> Ping?
> 
> 
> On Fri, Aug 16, 2013 at 1:15 PM, Jack Mitchell <ml@communistcode.co.uk
> <mailto:ml@communistcode.co.uk>> wrote:
> 
>     On 16/08/13 12:40, Laszlo Papp wrote:
>     > Hi,
>     >
>     > alternatively: is there an option to turn gtk, especially the docs
>     off?
>     >
>     > Cheers,
>     > Laszlo
>     >
>     >
> 
>     I don't know how to properly stop it building, or turn it off but I can
>     tell you the cause.
> 
>     Running bitbake -g core-image-minimal outputs the dependency graphs, and
>     by examining that it seems as though the following packages pull in
>     gtk-doc related packages.
> 
>     "connman" -> "gtk-doc-stub-native"
>     "kmod-native" -> "gtk-doc-stub-native"
>     "kmod" -> "gtk-doc-stub-native"
>     "glib-2.0" -> "gtk-doc-stub-native"
>     "glib-2.0-native" -> "gtk-doc-stub-native"
> 
>     Now, all these packages are gtk-doc-stub[-native], which is
>     described as:
> 
>     DESCRIPTION = "Stub implementation of gtk-doc, as we don't want to build
>     the API documentation"
> 
>     So it sounds like gtk-docs aren't actually being built, but the stubs
>     provide enough to make the package think they're being built...
> 
>     That's all I know, someone with more gtk knowledge than me can probably
>     fill in the reason for why it's required to build those packages.
> 
>     Cheers,
> 

Having a quick look around it seems as though glib can be built with
docs disabled:

--disable-gtk-doc and --enable-gtk-doc.  By default the configure script
will try to auto-detect whether the gtk-doc package is installed. If it
is, then it will use it to extract and build the documentation for the
GLib library. These options can be used to explicitly control whether
gtk-doc should be used or not. If it is not used, the distributed,
pre-generated HTML files will be installed instead of building them on
your machine.

the glib-2.0 recipe inherits gtk-doc, but doesn't disable it anywhere. I
imagine that you could add --disable-gtk-doc and remove the gtk-doc
inherit to stop glib-2.0 requiring the stub.

It seems here: http://patches.openembedded.org/patch/32567/

gtk-doc was specifically added back into the connman build.

kmod also has a --disable-gtk-doc configure option.

Here is the patch which kicks it all off:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026077.html

So, make of this what you will. I've cc'd Ross in to see if he has a
specific reason for re-enabling gkt-doc in some packages. Maybe we
should turn it into an image feature...?

Regardless of all this though, it seems the packages will ship with docs
anyway, just pre-built HTML ones, so is it worth it?

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambrideshire, UK
  http://www.embed.me.uk
--

