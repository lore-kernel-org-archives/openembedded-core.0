Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RYQR8-00050P-L3
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 23:58:02 +0100
Received: by qadb17 with SMTP id b17so45781qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 14:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=wuh25O9syqUPq6QuPACLEcaYD4S3Abg7Sj7T6Q72yNU=;
	b=Gp8OKpREYpNzwfrR9HGldQCybLjujB36+BY+bBgTUvrKZkoomK8Goj1O8HtkBGEGbw
	1YJKi4SJUcgClqp/SAORfEjghbXSGVwQpHsalgHnmqJu+jR+fP2x/aj7i8F0pKRh9FgK
	IMPO7aI577dkuqwqDcy60d+0K+w+V9QDScfcY=
Received: by 10.224.203.202 with SMTP id fj10mr398463qab.66.1323298273303;
	Wed, 07 Dec 2011 14:51:13 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Wed, 7 Dec 2011 14:50:52 -0800 (PST)
In-Reply-To: <20111207215306.GE6351@sakrah.homelinux.org>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
	<20111207215306.GE6351@sakrah.homelinux.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 7 Dec 2011 15:50:52 -0700
X-Google-Sender-Auth: AOprIaiAvkYYW3vZJzf9nXn-NKk
Message-ID: <CABcZANnKdH1M-BykE0bgQ9BzcmeMC9=jb1NeXH0seBa4SwW7rw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] Add copyleft compliance class
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
X-List-Received-Date: Wed, 07 Dec 2011 22:58:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2011 at 2:53 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/cop=
yleft_compliance.bbclass
>> new file mode 100644
>> index 0000000..5d9ab11
>> --- /dev/null
>> +++ b/meta/classes/copyleft_compliance.bbclass
>> @@ -0,0 +1,94 @@
>> +# Deploy sources for recipes for compliance with copyleft-style license=
s
>> +# Defaults to using symlinks, as it's a quick operation, and one can ea=
sily
>> +# follow the links when making use of the files (e.g. tar with the -h a=
rg).
>> +#
>> +# By default, includes all GPL and LGPL, and excludes CLOSED and Propri=
etary.
>> +#
>> +# vi:sts=3D4:sw=3D4:et
>> +
>> +COPYLEFT_SOURCES_DIR ?=3D '${DEPLOY_DIR}/copyleft_sources'
>> +
>> +COPYLEFT_LICENSE_INCLUDE ?=3D 'GPL* LGPL*'
>> +COPYLEFT_LICENSE_INCLUDE[type] =3D 'list'
>> +COPYLEFT_LICENSE_INCLUDE[doc] =3D 'Space separated list of globs which =
include licenses'
>> +
>> +COPYLEFT_LICENSE_EXCLUDE ?=3D 'CLOSED Proprietary'
>> +COPYLEFT_LICENSE_EXCLUDE[type] =3D 'list'
>> +COPYLEFT_LICENSE_INCLUDE[doc] =3D 'Space separated list of globs which =
exclude licenses'
>> +
>> +
>> +def copyleft_should_include(d):
>> + =C2=A0 =C2=A0"""Determine if this recipe's sources should be deployed =
for compliance"""
>> + =C2=A0 =C2=A0import ast
>> + =C2=A0 =C2=A0import oe.license
>> + =C2=A0 =C2=A0from fnmatch import fnmatchcase as fnmatch
>> +
>> + =C2=A0 =C2=A0if oe.utils.inherits(d, 'native', 'nativesdk', 'cross', '=
crossdk'):
>
> we do ship some of them in SDK so IMO they should not be excluded.

Fair enough. It'd probably be useful to hook something in to use the
output of this class to produce a tree of just the sources that went
into a given image or sdk, to go alongside the new manifests. I think
this is good to go in though, I'll submit a second patch in the next
day or two to enhance it to cover more, unless someone disagrees with
that approach.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


