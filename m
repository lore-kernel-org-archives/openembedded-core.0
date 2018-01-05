Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8309C783DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 01:07:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0517DiR029912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jan 2018 17:07:13 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Thu, 4 Jan 2018 17:07:13 -0800
From: "Fan, Wenzong" <Wenzong.Fan@windriver.com>
To: "OHLY, PATRICK" <patrick.ohly@intel.com>, =?iso-8859-1?Q?Jos=E9_Bollo?=
	<jobol@nonadev.net>
Thread-Topic: [OE-core] [PATCH] shadow: 'useradd' copies root's extended
	attributes
Thread-Index: AQHThT4var3dRteTFUSk0mP+bI09yKNkBlcAgAAGdYCAABBQAIAAAwwAgABW5K0=
Date: Fri, 5 Jan 2018 01:07:12 +0000
Message-ID: <7071668FA690C2448AC06FD9CFF240FD014013CF0D@ALA-MBC.corp.ad.wrs.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>,
	<1515066650.10775.24.camel@intel.com>
In-Reply-To: <1515066650.10775.24.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.17.212]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Fri, 05 Jan 2018 01:07:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It works and will override the labels of home dir that SELinux applied, tha=
t's the issue.=0A=
=0A=
For SELinux enabled system, the user's home dir should have lavel 'user_hom=
e_dir_t' instead of 'etc_t', it prevents users from creating files in their=
 home dir.=0A=
=0A=
Thanks=0A=
Wenzong=0A=
________________________________________=0A=
From: Patrick Ohly [patrick.ohly@intel.com]=0A=
Sent: Thursday, January 04, 2018 7:50 PM=0A=
To: Fan, Wenzong; Jos=E9 Bollo=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] shadow: 'useradd' copies root's extended att=
ributes=0A=
=0A=
On Thu, 2018-01-04 at 19:39 +0800, wenzong fan wrote:=0A=
> If so, I think we should wrapper the logic with:=0A=
>=0A=
> +#if defined(WITH_ATTR) && !defined(WITH_SELINUX)=0A=
> +      attr_copy_file (def_template, user_home, NULL, NULL);=0A=
> +#endif=0A=
=0A=
Does attr_copy_file fail when SELinux is active? In other words, why=0A=
should it be disabled when using SELinux?=0A=
=0A=
File capabilities are also stored in xattrs. It might be relevant to=0A=
copy those when using SELinux. Or do I miss something?=0A=
=0A=
--=0A=
Best Regards, Patrick Ohly=0A=
=0A=
The content of this message is my personal opinion only and although=0A=
I am an employee of Intel, the statements I make here in no way=0A=
represent Intel's position on the issue, nor am I authorized to speak=0A=
on behalf of Intel on this matter.=0A=
=0A=
=0A=

