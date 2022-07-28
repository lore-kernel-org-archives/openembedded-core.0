Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <593d8723-658b-181f-084b-0f310d83c519@gmail.com>
Date: Thu, 28 Jul 2022 00:03:07 -0400
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCHv2]] recipes-support: rng-tools change systemd service name
References: <20220726193322.1569574-1-limon.anibal@gmail.com>
 <20220727124406.4f7bc8ec@booty>
 <CAPS-YPA4qwJu_3dJ+5X+HEzE1ZGzT6H4Y2urbCKzT14ZPOOiKg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
In-Reply-To: <CAPS-YPA4qwJu_3dJ+5X+HEzE1ZGzT6H4Y2urbCKzT14ZPOOiKg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: An?bal Lim?n <limon.anibal@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, otavio.salvador@ossystems.com.br, Richard Purdie <richard.purdie@linuxfoundation.org>



On 7/27/22 10:51 AM, An?bal Lim?n wrote:
> 
> 
> On Wed, Jul 27, 2022 at 5:44 AM Luca Ceresoli <luca.ceresoli@bootlin.com 
> <mailto:luca.ceresoli@bootlin.com>> wrote:
> 
>     Hello Aníbal,
> 
>     On Tue, 26 Jul 2022 14:33:22 -0500
>     "An?bal Lim?n" <limon.anibal@gmail.com
>     <mailto:limon.anibal@gmail.com>> wrote:
> 
>      > From: Aníbal Limón <limon.anibal@gmail.com
>     <mailto:limon.anibal@gmail.com>>
>      >
>      > Change systemd service name from rngd -> rng-tools to avoid load
>     twice
>      > the service when sysvinit compatibility is enabled,
>      >
>      > ...
>      > root@:~# ps  | grep rng
>      >    23 root         0 SW   [hwrng]
>      > 13109 root      3528 R    /usr/sbin/rngd -f -r /dev/hwrng
>      > 13117 root      2348 S    grep rng
>      > 29418 root     12756 S    /usr/sbin/rngd -r /dev/hwrng
>      > ...
>      >
>      > Signed-off-by: Aníbal Limón <limon.anibal@gmail.com
>     <mailto:limon.anibal@gmail.com>>
>      > ---
>      >  .../rng-tools/{rngd.service => rng-tools.service}    |  0
>      >  meta/recipes-support/rng-tools/rng-tools_6.15.bb
>     <http://rng-tools_6.15.bb>     | 12 ++++++------
>      >  2 files changed, 6 insertions(+), 6 deletions(-)
>      >  rename meta/recipes-support/rng-tools/rng-tools/{rngd.service =>
>     rng-tools.service} (100%)
>      >
>      > diff --git
>     a/meta/recipes-support/rng-tools/rng-tools/rngd.service
>     b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>      > similarity index 100%
>      > rename from meta/recipes-support/rng-tools/rng-tools/rngd.service
>      > rename to meta/recipes-support/rng-tools/rng-tools/rng-tools.service
>      > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>     <http://rng-tools_6.15.bb>
>     b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>     <http://rng-tools_6.15.bb>
>      > index 0696351903..efc08b5e0a 100644
>      > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>     <http://rng-tools_6.15.bb>
>      > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
>     <http://rng-tools_6.15.bb>
>      > @@ -11,7 +11,7 @@ DEPENDS = "sysfsutils openssl"
>      >  SRC_URI =
>     "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https
>     <http://github.com/nhorman/rng-tools.git;branch=master;protocol=https> \
>      >             file://init \
>      >             file://default \
>      > -           file://rngd.service \
>      > +           file://rng-tools.service \
> 
>     This feels strange to me: "rng-tools" does not look like a daemon name,
>     but rather a, well, tools name. Maybe "rng-daemon" would clarify?
> 
> 
> Another option is to change the init daemon to be called rngd.

I think yet another way is to check for condition when sysvinit 
compatibility is enabled during install time and decide if we need to 
install both sysvinit script and systemd service or not. I do not think
renaming .service file is a good solution here.

> 
> Regards,
> Anibal
> 
> 
>     Still I'm taking this patch for testing, I'll replace it with v2 should
>     you send one.
> 
>     However please note there is an extra ']' in the subject: [PATCHv2]]
>     should be [PATCHv2]. This leads 'git am' to produce a commit starting
>     with a "] " prefix. I fixed it while applying, however you should check
>     that in the future.
> 
>     Best regards.
>     -- 
>     Luca Ceresoli, Bootlin
>     Embedded Linux and Kernel engineering
>     https://bootlin.com <https://bootlin.com>
> 
> 
> 
> 
> 
