Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1Rl3X0-0005YC-Vk
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:08:19 +0100
Received: by obcwn6 with SMTP id wn6so1426844obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 11:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=qu4gM/xV9uju6fuhnDVHqh9cVzFpVomvG0uRx8gl8Z0=;
	b=IV0WbpenI6us4TpF6JEvO5gcN8ZfnwF0GWwJClHEjRsmdf0vGksv3vkiqBNl2KPsID
	E4Z+9CIny4uYGq7Sbm+YZxEOQc0LCwF2Vb1Vpj7qENgwtPUOfsp+LwRnUKYgoKO9VFcn
	RGn6hr6wuCbHU6WD/hm4QJpG5TeJPoR7/ApKY=
MIME-Version: 1.0
Received: by 10.182.109.38 with SMTP id hp6mr313469obb.64.1326308448227; Wed,
	11 Jan 2012 11:00:48 -0800 (PST)
Received: by 10.60.34.138 with HTTP; Wed, 11 Jan 2012 11:00:48 -0800 (PST)
In-Reply-To: <20120107141410.3d35c503@eb-e6520>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
	<20120107141410.3d35c503@eb-e6520>
Date: Wed, 11 Jan 2012 11:00:48 -0800
Message-ID: <CAGDS+nm7EhwZUxJBiTkGa3x5R71effKqH29J2RzO81ff_kE7Rg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC v2] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2012 19:08:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 7, 2012 at 5:14 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi,
>
> Le Fri, =A06 Jan 2012 20:51:54 -0800,
> Steve Sakoman <steve@sakoman.com> a =E9crit :
>> -FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-serve=
r ${localstatedir}/lib/dhcp/"
>> +FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-serve=
r"
>
> isn't this directory necessary for dhcp-server ?

Sorry for the delay in responding!  I missed seeing your comment.

Yes, both packages need this directory.  But the dhcp-server package
init already creates it if it doesn't exist:

case "$1" in
	start)
		echo -n "Starting DHCP server: "
		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/

So it should be no issue moving the /var/lib/dhcp FILE spec to the
dhcp-client package.

Steve


