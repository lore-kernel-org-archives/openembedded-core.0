Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 83D457149C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:14:24 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x3so6141114qcv.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 05:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=+RKfW3fAg9X1kYF8StZf0N4jig6zUU4SWPhXZh8uwW8=;
	b=tH/+9jqeZvB35Pyt/I9XTOln3DWpim5XQvBvuEnPy0VAvDWUP6JDzA2vNbmsYGzrgu
	UrE5BNRqmo8RYz3+wZ+DvMK1QL0xlRU8KjxtPzGFoTrdgYw5brsEOIfHHeH6/3gLxM5o
	DhLItJLHZ64S/WyQ7ceM28ZYFMDT98hgsTMteyp9uCmBfFichcKa/gel5hjPO8DOwP74
	HwA1UwCOe3XQTEFpIDgQ6/yGuMAT/VpPlHpxkB0UBpnurDB8666jWsjak6Y75ngtKIzt
	v1iqcq4EhUzqq+VMBPxQG7N/y6kPvNakl+uaa0hdhTcDOo9XgZVWRzROFL9trp6DKHcq
	MC2A==
X-Received: by 10.229.192.197 with SMTP id dr5mr29612507qcb.18.1411388066055; 
	Mon, 22 Sep 2014 05:14:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.96.58.201 with HTTP; Mon, 22 Sep 2014 05:14:05 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 22 Sep 2014 14:14:05 +0200
Message-ID: <CAPybu_2TqpNtPu+gZWsck8uYsEOYsAUATaYnKBgR-EVe9CvUgA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Ming Liu <ming.liu@windriver.com>, Saul Wold <sgw@linux.intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: ?Regression? Removed linker symbolic link
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
X-List-Received-Date: Mon, 22 Sep 2014 12:14:27 -0000
Content-Type: text/plain; charset=UTF-8

Hello

On my distribution I have a couple of binary packages (java and fglrx)
that expect the dynamic linker on /lib64/ld-linux-x86-64.so.2

Therefore I have added a dummy package that justs creates a link on
/lib/ld-linux-x86-64.so.2 and make both packages depend on this.

This was working ok, but since I updated to  poky 1.6.1 this has
stopped working :( The link seems to be removed from my rootfs.

It is removed when the function _run_ldconfig on rootfs.py is executed.

After some debugging I found that the cause  is this patch:


Date:   Mon May 5 10:30:33 2014 +0800

    ldconfig-native: also default to lib32 and lib64 directories

    make ldconfig default to /lib+/usr/lib, /lib32+/usr/lib32 and
    /lib64+/usr/lib64 on bi-ABI architectures.

    (From OE-Core rev: c90bb98d4ac14562ef4882691daed3aaa9d08504)

    (From OE-Core rev: 44202d78102fa58ba99040a79d5a61c44033f57d)

    Signed-off-by: Ming Liu <ming.liu@windriver.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Is there something I can do to avoid the removal of this file?
Any other better method to do this?

Thanks and best regards!



-- 
Ricardo Ribalda

