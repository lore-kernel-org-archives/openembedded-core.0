Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 30CDF745D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:23:14 +0000 (UTC)
Received: from [10.0.0.246] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 469E51C1282;
	Mon, 20 Aug 2018 11:23:14 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1534699224.git.raj.khem@gmail.com>
	<f1c6008db923f577cb03d5461c06ad97d55a57f6.1534699224.git.raj.khem@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <45c972cc-6abf-8df2-e4db-ee84abd49dc9@geanix.com>
Date: Mon, 20 Aug 2018 11:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <f1c6008db923f577cb03d5461c06ad97d55a57f6.1534699224.git.raj.khem@gmail.com>
Subject: Re: [PATCH 4/9] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Mon, 20 Aug 2018 09:23:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Khem,

On 19/08/2018 19.23, Khem Raj wrote:
> - Import from meta-oe layer
> 
> - This is useful for many packages where CR-LF
>    needs to be adjusted, many recipes depend on it
>    e.g. meta-multimedia libebml and so on.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/classes/dos2unix.bbclass | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta/classes/dos2unix.bbclass
> 
> diff --git a/meta/classes/dos2unix.bbclass b/meta/classes/dos2unix.bbclass
> new file mode 100644
> index 0000000000..3fc17e2196
> --- /dev/null
> +++ b/meta/classes/dos2unix.bbclass
> @@ -0,0 +1,14 @@
> +# Class for use to convert all CRLF line terminators to LF
> +# provided that some projects are being developed/maintained
> +# on Windows so they have different line terminators(CRLF) vs
> +# on Linux(LF), which can cause annoying patching errors during
> +# git push/checkout processes.
> +
> +do_convert_crlf_to_lf[depends] += "dos2unix-native:do_populate_sysroot"

Shouldn't the dos2unix recipe live in oe-core also, when a class depends 
upon it?

// Martin

> +
> +# Convert CRLF line terminators to LF
> +do_convert_crlf_to_lf () {
> +	find ${S} -type f -exec dos2unix {} \;
> +}
> +
> +addtask convert_crlf_to_lf after do_unpack before do_patch
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

