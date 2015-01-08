Return-Path: <akuster808@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1F5609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 22:35:56 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id r5so5245533qcx.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 14:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=hO0qybq5BtMunbqZ0FHugfbhhEWI3gqhj1FDdgkIrvU=;
	b=Gh0Ya9YHSXrlZzTHhOZs2iFZUOUgn3pwv6kj5jTVxey/fGDhUpy/8Jz0mFU5M2nZ5A
	y62m+5t6UkWniZ0waFNmEIVT4D+G5isj+VZioE/6n92N9zbzlm7s/JZEa1zs+wkRUWyz
	NWSOrLd21lWl2Nj1JBGPfTj/ZY+xYZ+QHgqgLLRNxGzDK6dAoxr9JdMrm5M77wc3/b01
	mKY54Zvs+gAMwDzAKIarhlCAqo+i9bhN8H2/uWbh1axdYBLiPPQ0BqBwIoRITEK14nmy
	gLyEMf+HtwPLoi6PMCfNw0FErjroruVI3lDPyxTiEKy8hUI+6p+qKrQYxdHRNqqpCJ68
	qOWQ==
X-Received: by 10.140.94.77 with SMTP id f71mr19419458qge.68.1420756557377;
	Thu, 08 Jan 2015 14:35:57 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id 62sm5270821qgj.16.2015.01.08.14.35.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 14:35:56 -0800 (PST)
Message-ID: <54AF064A.4070608@gmail.com>
Date: Thu, 08 Jan 2015 14:35:54 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>, 
	openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>, 
	Ross Burton <ross.burton@intel.com>, "Peter A. Bigot" <pab@pabigot.com>
References: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
In-Reply-To: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH] systemd-networkd: cherry picking route handling patch
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
X-List-Received-Date: Thu, 08 Jan 2015 22:36:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Does this affect Dizzy?

- armin

On 01/08/2015 12:43 AM, Maciej Borzecki wrote:
> There is a problem in systemd-networkd version used in OE-core (216 as
> of now) that prevents a successful communication in a configuration
> that uses a static or IPv4 LL address alongside a dynamically obtained
> one. The setup is rather not uncommon as is makes sense to always have
> a static well known address that a technician or a support engineer
> can access while in the field.
>
> The current code in systed-networkd uses a clever trick to add a
> static route to the gateway, to workaround a misconfigured DHCP server
> that would assign an address from network pool that the gateway is not
> a part of. The trick was missing a source IP address specification in
> the static route, thus normally the first assigned IP address would be
> used for outgoing IP packets. In this particular case the address
> would the static one, hence the packet would most probably be dropped
> by the router. Also, it is quite common in smaller networks that the
> DHCP server, gateway router and even a DNS server are colocated. In
> these setups the current code will effectively render any
> communication to or past the router impossible.
>
>
> Maciej Borzecki (1):
>    systemd: cherry-pick patch fixing networkd gateway route handling
>
>   ...d-preferred-source-to-dhcp4-gateway-route.patch | 109 +++++++++++++++++++++
>   meta/recipes-core/systemd/systemd_216.bb           |   1 +
>   2 files changed, 110 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch
>

