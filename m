Return-Path: <stefan@agner.ch>
X-Greylist: delayed 389 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jan 2020 13:04:05 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 33E297FBEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:04:05 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id A8F285C7DB1;
	Mon, 20 Jan 2020 13:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579525056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=+9UxhtTe8+pc6CYamQoYcTV8YRCJiBjXIToN7eW8/vg=;
	b=fpocwZtQC1Vuh0ZOabg/+4krccaKNn6sYIGhgWSxrqrVWlikyttUh5Kenmj1hOR05/aLJ/
	A7sskD3x+6jJtFMQlr3RC1axd1u3jJ9tKoHMUfSxQmOqEAWwXS/n/j8K0zFDkhSJO7EA8p
	JwuwMb7lae7dxyV17XMlsAPY4bY700s=
MIME-Version: 1.0
Date: Mon, 20 Jan 2020 13:57:36 +0100
From: Stefan Agner <stefan@agner.ch>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
In-Reply-To: <20200120123246.o5abx73ehcoqbbim@qschulz>
References: <20180514144415.40730-1-stefan@agner.ch>
	<20200113145729.amwegnpvnp2kb3ut@qschulz>
	<20200120123246.o5abx73ehcoqbbim@qschulz>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
X-Sender: stefan@agner.ch
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Mon, 20 Jan 2020 13:04:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2020-01-20 13:32, Quentin Schulz wrote:
> Hi all,
> 
> On Mon, Jan 13, 2020 at 03:57:31PM +0100, Quentin Schulz wrote:
>> Hi all,
>>
>> On Mon, May 14, 2018 at 04:44:15PM +0200, Stefan Agner wrote:
>> > From: Stefan Agner <stefan.agner@toradex.com>
>> >
>> > The udhcpc script calls ip addr flush .. which flushes addresses
>> > of any address family, including IPv6. However, busybox udhcpc is
>> > IPv4 only and should not influence IPv6 addressing. Hence use ip
>> > addr flush with family constrait.
>> >
>> > The script particularly broke IPv6 SLAAC: Typically when udhcpc
>> > calls the script the kernel already assigned the IPv6 link-local
>> > address. The flush removes the link-local IPv6 address again and
>> > prohibits proper IPv6 operation such as SLAAC since neighbor
>> > discovery protocol relies on IPv6 link-local addressing.
>> >
>> > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> > ---
>> >  meta/recipes-core/busybox/files/simple.script | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
>> > index 6ed0293525..8b5eb53633 100644
>> > --- a/meta/recipes-core/busybox/files/simple.script
>> > +++ b/meta/recipes-core/busybox/files/simple.script
>> > @@ -28,7 +28,7 @@ case "$1" in
>> >  		fi
>> >  		if ! root_is_nfs ; then
>> >                          if [ $have_bin_ip -eq 1 ]; then
>> > -                                /SBIN_DIR/ip addr flush dev $interface
>> > +                                /SBIN_DIR/ip -4 addr flush dev $interface
>> >                                  /SBIN_DIR/ip link set dev $interface up
>> >                          else
>> >                                  /SBIN_DIR/ifconfig $interface 0.0.0.0
>>
>> Kindly pinging, happened to us as well many times.
>>
> 
> Kindly pinging.

Just checked, we still override that script in our layer, so definitely
would be happy if this gets merged upstream so I can get rid of our
custom script downstream.

--
Stefan

