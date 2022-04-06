Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <dedf19a5167179f8960baf92acf74edf0dc202b7.camel@linuxfoundation.org>
Subject: Ping issues on systemd images - Intermittent Notes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 06 Apr 2022 16:52:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>

Do we have any experts on systemd and connman? I did find a little more data on
some of our mystery autobuilder ping failures:

Ping issues on systemd images
=============================

This failed with my ping test debugging present so we got more info. The host
was unreachable.

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/2888/steps/12/logs/stdio

I reran the testimage and it passed. I diff'd the qemu console log output and
there wasn't any difference that was meaningful. The testimage log output wasn't
meaningful.

I did find this interesting though:

pokybuild@ubuntu1804-ty-3:~/yocto-worker/qemumips-alt/build/build/tmp/log/runtime-hostdump/202204051947_qemu$ cat target_00_ip 
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,DYNAMIC,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:12:34:06 brd ff:ff:ff:ff:ff:ff
    inet 169.254.89.149/16 brd 169.254.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::5054:ff:fe12:3406/64 scope link 
       valid_lft forever preferred_lft forever

The :06 at the end of the mac address shows it was the right qemu and I couldn't
find any other qemu using 192.168.7.6 on that machine at the time. Note there is
no ip address configured for that interface.

I suspect something in systemd+connman is causing this intermittently. We need
better network interface debug enabled in connman/systemd so we can attempt to
debug this further. Any pointers on how to do that very welcome!

Cheers,

Richard





