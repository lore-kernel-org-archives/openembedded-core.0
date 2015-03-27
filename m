Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 39A87734E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 17:31:58 +0000 (UTC)
Received: by qcay5 with SMTP id y5so22529898qca.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:user-agent:mime-version
	:content-type; bh=E5UDtatAV213jqZOzrt1TPEcfwPwFsfkCgJRXYAtjHU=;
	b=jZfzwvIJ7U8ccU2IPmVkSnNoYe6cHSWLhKgc5qEnIpJ3rCJjIAnTyAhwyIHc+7ppo0
	lS/zz+eBZxrJUfUGwEKDtRIkv5uWq+zPeulcpUmK2hG/++Et8skTA9K8yO6G+wy+dquc
	uuMBO/zE8pU3UXEp4DJdlmWshXtL0Tdc53rwRVFDJpVEdwdgVaxx2FJBU0uA236uhoQu
	ZrIR9MKmKvEDc6bkYk4zNxIWgaUmuT74btevk+GhYjfetOG9EhD2iOQSW0F8MSKCIShE
	OFzaBS6Qbsg4QNO0aDHfSiFI5WY+e9gng2//6H3OaRye2fpMAqpJWxXbKOLHdsLeY2IQ
	xu1w==
X-Received: by 10.140.232.15 with SMTP id d15mr26775062qhc.52.1427477519759;
	Fri, 27 Mar 2015 10:31:59 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id 75sm1877224qhw.22.2015.03.27.10.31.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2015 10:31:59 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 17:31:55 +0000
Message-ID: <87d23uibxw.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Subject: Ownership issue in package contents
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
X-List-Received-Date: Fri, 27 Mar 2015 17:31:59 -0000
Content-Type: text/plain

Hi,

I'm observing an issue with directory ownership in package
contents.  Not sure if I'm overlooking something really basic or
if I hit a bug.

Here's a minimal recipe to illustrate the problem:

$ cat foo.bb
LICENSE = "CLOSED"

inherit useradd

USERADD_PACKAGES =  "${PN}"
USERADD_PARAM_${PN} = "foo"

do_install() {
    install -d -m 755 ${D}${libdir}/foo
        touch ${D}${libdir}/foo/bar
            chown -R foo:foo ${D}${libdir}/foo
            }

Here's the package content:

$ dpkg -c foo_1.0-r0.0_cortexa9hf-vfp-neon.ipk
drwxrwxrwx root/root         0 2015-03-27 13:37 ./
drwxr-xr-x root/root         0 2015-03-27 13:37 ./usr/
drwxr-xr-x root/root         0 2015-03-27 13:37 ./usr/lib/
drwxr-xr-x root/root         0 2015-03-27 13:37 ./usr/lib/foo/
-rw-r--r-- foo/foo           0 2015-03-27 13:37 ./usr/lib/foo/bar


Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
the recipe, ./usr/lib/foo/ in the package is owned by root.
However, its content has the right ownership.

I also generated and checked the rpm package and observed the
same issue.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

