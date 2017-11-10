Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9399F6022E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 07:17:08 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id vAA7H9mn019864
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 10 Nov 2017 08:17:09 +0100
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id vAA7H846003938
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 10 Nov 2017 08:17:09 +0100
To: Nathan Rossi <nathan@nathanrossi.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20171109132529.26285-1-nathan@nathanrossi.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <d7759440-3eef-7974-85d8-cae3b44a894d@siemens.com>
Date: Fri, 10 Nov 2017 08:17:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171109132529.26285-1-nathan@nathanrossi.com>
Subject: Re: [PATCH] busybox.inc: Add sanity check to test if the suid binary provides sh
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
X-List-Received-Date: Fri, 10 Nov 2017 07:17:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I don't think so, that adding bbfatal into this recipe is a good
solution. Someone could build the busybox with /bin/sh linking into
.suid eg. for more secure. We can leave live with this one as before.

Andrej

On 11/09/2017 02:25 PM, Nathan Rossi wrote:
> Add a sanity check during the do_compile task to fail if the suid
> busybox provides /bin/sh. This is considered as a hard fail since not
> only is providing sh as suid problematic for security reasons but also
> because the sh configured for suid is less functional than the nosuid
> configured sh and breaks a number of required features (e.g. 64-bit
> test).
> 
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 4012f921c6..157aea3968 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -183,6 +183,12 @@ do_compile() {
>  			oe_runmake busybox.links
>  			mv busybox.links busybox.links.$s
>  		done
> +
> +		# hard fail if sh is being linked to the suid busybox (detects bug 10346)
> +		if grep -q -x "/bin/sh" busybox.links.suid; then
> +			bbfatal "busybox suid binary incorrectly provides /bin/sh"
> +		fi
> +
>  		# copy .config.orig back to .config, because the install process may check this file
>  		cp .config.orig .config
>  		# cleanup
> 

