Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1871B77A98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 22:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0197018334;
	Fri, 17 Mar 2017 23:19:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nyjvn2gIeA03; Fri, 17 Mar 2017 23:19:18 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 63464182A3;
	Fri, 17 Mar 2017 23:19:18 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B31C1A06F;
	Fri, 17 Mar 2017 23:19:18 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FFD81A06D;
	Fri, 17 Mar 2017 23:19:18 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 17 Mar 2017 23:19:18 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 13D961044;
	Fri, 17 Mar 2017 23:19:18 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 17 Mar 2017 23:19:17 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 17 Mar 2017 23:19:17 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 17 Mar 2017 23:19:17 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@intel.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Confusion regarding the image feature ssh-server-openssh and
	what it pulls in
Thread-Index: AdKfazHlFjK7hnAcRI6KKZASQrdjyg==
Date: Fri, 17 Mar 2017 22:19:17 +0000
Message-ID: <dddabc7ab12545229c35df6b74808e05@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: =?iso-8859-1?Q?Johnny_Wahnstr=F6m?= <johnnyw@axis.com>
Subject: Confusion regarding the image feature ssh-server-openssh and what it pulls in
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
X-List-Received-Date: Fri, 17 Mar 2017 22:19:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

How come an image feature with a name like ssh-server-openssh has the=20
following chain of dependencies:

FEATURE_PACKAGES_ssh-server-openssh ->
  packagegroup-core-ssh-openssh ->
    openssh ->
      openssh-scp
      openssh-ssh
      openssh-sshd ->
        openssh-keygen
      openssh-keygen

rather than:

FEATURE_PACKAGES_ssh-server-openssh ->
  openssh-sshd ->
    openssh-keygen

The name clearly suggests that using it will install an SSH server,=20
not also the client tools (scp and ssh).

Would a patch to change the FEATURE_PACKAGES_ssh-server-openssh to=20
do the right thing and depend on openssh-sshd instead be accepted?

//Peter


