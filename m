Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 5747F605F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 10:29:25 +0000 (UTC)
Received: from localhost (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 61876234981;
	Wed,  4 Feb 2015 11:29:24 +0100 (CET)
Date: Wed, 4 Feb 2015 11:29:23 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Message-ID: <20150204102923.GA3901@localhost.localdomain>
References: <1423006826-10627-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1423006826-10627-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: use kB for the partitions size
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
X-List-Received-Date: Wed, 04 Feb 2015 10:29:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 02/04 00:40, Alexandre Belloni wrote:
> Use kB instead of MB for the partition size to get a better granularity.
>
> This is needed on some SoC (i.mx, omap) where it is necessary to create
> partitions as small as 64kB.
>
> Keep the backward compatibility by assuming MB when no unit is provided.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  .../wic/3rdparty/pykickstart/commands/partition.py |  4 +--
>  scripts/lib/wic/3rdparty/pykickstart/options.py    | 21 ++++++++++++-
>  scripts/lib/wic/kickstart/__init__.py              |  2 +-
>  .../lib/wic/kickstart/custom_commands/partition.py | 36 +++++++++++-----------
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 +-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  2 +-
>  scripts/lib/wic/utils/partitionedfs.py             |  4 +--
>  7 files changed, 45 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
> index 56b91aa9d9a4..b564b1a7abb9 100644
> --- a/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
> +++ b/scripts/lib/wic/3rdparty/pykickstart/commands/partition.py
> @@ -78,7 +78,7 @@ class FC3_PartData(BaseData):
>          if self.recommended:
>              retval += " --recommended"
>          if self.size and self.size != 0:
> -            retval += " --size=%s" % self.size
> +            retval += " --size=%sk" % self.size
>          if hasattr(self, "start") and self.start != 0:
>              retval += " --start=%s" % self.start
>
> @@ -216,7 +216,7 @@ class FC3_Partition(KickstartCommand):
>                        callback=part_cb, nargs=1, type="string")
>          op.add_option("--recommended", dest="recommended", action="store_true",
>                        default=False)
> -        op.add_option("--size", dest="size", action="store", type="int",
> +        op.add_option("--size", dest="size", action="store", type="size",
>                        nargs=1)
>          op.add_option("--start", dest="start", action="store", type="int",
>                        nargs=1)
> diff --git a/scripts/lib/wic/3rdparty/pykickstart/options.py b/scripts/lib/wic/3rdparty/pykickstart/options.py
> index 341c5d7298b0..7bbe6a85a156 100644
> --- a/scripts/lib/wic/3rdparty/pykickstart/options.py
> +++ b/scripts/lib/wic/3rdparty/pykickstart/options.py
> @@ -143,6 +143,24 @@ def _check_string(option, opt, value):
>      else:
>          return value
>
> +def _check_size(option, opt, value):
> +    # Former default was MB
> +    if (value.isdigit()):
> +        return int(value) * 1024L
> +
> +    mapping = {"opt": opt, "value": value}
> +    if (not value[0:len(value)-1].isdigit()):

You might want to replace value[0:len(value)-1] with value[:-1] here and
in int(...) below.

Other than that, the patch looks ok for me. I've built a couple of
images with different sizes (with and without suffix), all worked fine.

Tested-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079


Niniejsza wiadomość wraz z załącznikami może
zawierać chronione prawem lub poufne informacje i została
wysłana wyłącznie do wiadomości i użytku osób, do których
została zaadresowana. Jeśli wiadomość została otrzymana
przypadkowo zabrania się jej kopiowania lub rozsyłania do osób
trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o
zaistniałej sytuacji za pomocą wiadomości zwrotnej.
Dziękujemy.

This message, including any attachments hereto,
may contain privileged or confidential information and is sent
solely for the attention and use of the intended addressee(s).
If you are not an intended addressee, you may neither use this
message nor copy or deliver it to anyone. In such case, you
should immediately destroy this message and kindly notify the
sender by reply email. Thank you.

