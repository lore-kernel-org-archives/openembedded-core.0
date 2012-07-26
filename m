Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SuECe-0004QT-6D
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 04:53:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6Q2fvJO009789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 19:41:57 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 25 Jul 2012 19:41:56 -0700
Message-ID: <5010AE26.5010908@windriver.com>
Date: Thu, 26 Jul 2012 10:40:38 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, Mark Hatle
	<mark.hatle@windriver.com>
X-Originating-IP: [128.224.162.230]
Subject: removing /etc/init.d/busybox-udhcpc
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
X-List-Received-Date: Thu, 26 Jul 2012 02:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I recently found that if "ip=dhcp" is specified in the kernel cmdline,
there would be some strange behaviour of udhcpc.

1. udhcpc is started two times during bootup.

    Starting Bootlog daemon: bootlogd.
    Configuring network interfaces... udhcpc (v1.19.4) started
    Sending discover...
    Sending select for 128.224.162.132...
    Lease of 128.224.162.132 obtained, lease time 172800
    /etc/udhcpc.d/50default: Adding DNS 128.224.160.11
    /etc/udhcpc.d/50default: Adding DNS 147.11.100.30
    /etc/udhcpc.d/50default: Adding DNS 147.11.1.11
    done.
    Starting portmap daemon...
    [...]
    Starting domain name service: named.
    udhcpc (v1.19.4) started
    Sending discover...
    Sending select for 128.224.162.132...
    Lease of 128.224.162.132 obtained, lease time 172800
    RTNETLINK answers: File exists
    /etc/udhcpc.d/50default: Adding DNS 128.224.160.11
    /etc/udhcpc.d/50default: Adding DNS 147.11.100.30
    /etc/udhcpc.d/50default: Adding DNS 147.11.1.11
    creating NFS state directory: done

2. udhcpc is *started* when system is being shutdown.

    Stopping domain name service: namedrndc: neither /etc/bind/rndc.conf nor /etc/bind/rndc.key wd
    .
    udhcpc (v1.19.4) started
    Sending discover...
    Sending select for 128.224.162.132...
    Lease of 128.224.162.132 obtained, lease time 172800
    RTNETLINK answers: File exists
    /etc/udhcpc.d/50default: Adding DNS 128.224.160.11
    /etc/udhcpc.d/50default: Adding DNS 147.11.100.30
    /etc/udhcpc.d/50default: Adding DNS 147.11.1.11
    Stopping system message bus: dbus.
    stopping statd: done

The reason is busybox installs a busybox-udhcpc init script, which would
start udhcpc when "ip=dhcp" is specified, but udhcpc is also invoked by
the networking service (as specified through /etc/network/interfaces).
That's why udhcpc is started twice.

And since the init script doesn't actually support "stop" actions, it
will start udhcpc again during system shutdown.

The obvious fix is to remove the busybox-udhcpc init script; all configs
should go through /etc/network/interfaces. But I'm wondering if anyone
has problems with that.

If no one objects, I will send the patch shortly.

jesse

P.S. it only happens for non-qemu targets since they have different
configs. I used an intel emenlow.


