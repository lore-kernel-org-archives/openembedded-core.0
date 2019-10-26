Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id E68437FC60
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:46:22 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id d83so3960258ilk.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LfRGzcxzrhhQzL2ghjH5mGYxx3zsZdl8NaCgTXV0DK4=;
	b=jWg0uQJ41XJWsmxxoxvTiOlGC632i+O5bfz0KF7qxzbajrmhexOqcxq0ZqVRvNT0oF
	jh1LI8lY/nF5mlm3GmXCL9f5d7NHo56hKNJpAhh+T6hy+GalcMvWxozCZbxAK4OZuU+g
	sbbkZdASm0QnLTl5gatTw9vKZ3KHfLLfC7iQJGaogY0LZdxGkNSU01oMyyqSVtqLxlDM
	agyf9NC3b42PYPS1Mm3oGG9Y/UTeXSzRpP7jNjY/IvF2OPNF+1lH+kMnE9lc0NpJgair
	zCd+E4Ebgt9aT37KONC0AmrhpwS5euV10H6w4XAzfuAEQfHfutOzf7Ad29e6gq7r/3Yx
	ZRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LfRGzcxzrhhQzL2ghjH5mGYxx3zsZdl8NaCgTXV0DK4=;
	b=Fg6grrtXbe9UEUso6FeUJwZ+Tk1XkJnIoYt4ed47YQdpQ1C2YdY4TzMHLU51cJMOne
	9DbmmhFl2M8HdAoyf3pG8htMReOYmmlN3xe0FdA+WwTO/wkGld6eUOrZjAT3ifdzffJS
	/77yanfahviJowf7o1RTErAlWiRiQl+wf71reItm2YjJ1gYXg2UHx48rZQEm5PfbwIUm
	uukoT3DgfwC4gQqWc/Dy3pljT/ox7WSDTT4H0+GMyBLgaxUSXZFni+RbmouVJU2Yy9gA
	HJy/fdNn6F4FQSB83EVF7BfKaSAA3L0aT6OFFtxs6uPn5ACUfmKJcA+vlwrXiJ2x4YNo
	2NUw==
X-Gm-Message-State: APjAAAXRr3jku48bjGuvX1tdNR9etS3ZrcWmld6aPu429lYfQwHaxSCX
	Ck+3HeEIqKIbmwY0NNoppmLfTi20ntzp81aKQKAmi6ef
X-Google-Smtp-Source: APXvYqxqjwWvcwZljUDKVqkIfasOTZsereUtPg9zp070GIEBXPO3zdA0W7utkxCdMvd8VMVV/EkLNW2cAap6Kpx9+q4=
X-Received: by 2002:a92:1948:: with SMTP id e8mr9050685ilm.302.1572083183721; 
	Sat, 26 Oct 2019 02:46:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Sat, 26 Oct 2019 02:46:22
	-0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Sat, 26 Oct 2019 20:46:22 +1100
Message-ID: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Sat, 26 Oct 2019 09:46:23 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I finally built the
zImage->zImage--4.19.75+git0+d573e8a79f-r0-20191026074920.bin and
zImage-initramfs ->
zImage-initramfs--4.19.75+git0+d573e8a79f-r0-20191026074920.bin based
on oe-core kernel.bbclass.

The zImage could be loaded by u-boot on RAM booting but failed at
mount rootfs which was fine as it did not bundle the rootfs. The
zImage-initramfs bundled to rootfs, but it could not be started and
stuck at u-boot Starting kernel, there was no trace of errors.

Hit any key to stop autoboot:  0
=> bootz ${loadaddr} - ${fdt_addr}
Kernel image @ 0x80800000 [ 0x000000 - 0x219df80 ]
## Flattened Device Tree blob at 83000000
   Booting using the fdt blob at 0x83000000
   Using Device Tree in place at 83000000, end 83008831
ft_system_setup for mx6

Starting kernel ...

Because zImage could be started, zImage-initramfs could not, that
implies there were no issues in the u-boot, is must be something wrong
with the zImage-initramfs. Seems debug is harder, are there anyway to
extract information from zImage-initramfs to figure out what is wrong?

Thank you.

Kind regards,

- jh

