Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D46C171A6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 08:10:23 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cb0r1-0006K9-EU from Awais_Belal@mentor.com ;
	Tue, 07 Feb 2017 00:10:23 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Tue, 7 Feb 2017 08:10:19 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Tue, 7 Feb 2017 08:10:19 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] [RFC]kernel-yocto.bbclass: ensure repatching
	when HEAD is checked out
Thread-Index: AQHSfgs+xBGNNfZTckauiD3ZsY2Me6FXVCeAgABEPYCAAfTXNg==
Date: Tue, 7 Feb 2017 08:10:19 +0000
Message-ID: <1486455019324.99247@mentor.com>
References: <1486118977-42065-1-git-send-email-awais_belal@mentor.com>
	<CADkTA4PUAoTG+apRuhRYiv9xgcH++gp7QKOke5dScidVhB1d6g@mail.gmail.com>,
	<CADkTA4Oic31VzZtcSz7nq_Loq0SYh8+LmvPCOB44Y-Gabs-xig@mail.gmail.com>
In-Reply-To: <CADkTA4Oic31VzZtcSz7nq_Loq0SYh8+LmvPCOB44Y-Gabs-xig@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC]kernel-yocto.bbclass: ensure repatching when HEAD is checked out
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
X-List-Received-Date: Tue, 07 Feb 2017 08:10:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,=0A=
=0A=
> If this works for you, I can send it in my next kernel pull request.=0A=
Works like a charm, thanks a lot :)=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Bruce Ashfield [bruce.ashfield@gmail.com]=0A=
Sent: Friday, February 3, 2017 11:20 PM=0A=
To: Belal, Awais=0A=
Cc: Patches and discussions about the oe-core layer=0A=
Subject: Re: [OE-core] [PATCH] [RFC]kernel-yocto.bbclass: ensure repatching=
 when HEAD is checked out=0A=
=0A=
Here's the patch that I came up with based on your change. The only differe=
nce=0A=
is that I modified the patching script to have a --clean option .. and used=
 that=0A=
instead. That way we keep the internals hidden.=0A=
=0A=
If this works for you, I can send it in my next kernel pull request.=0A=
=0A=
Bruce=0A=
=0A=
On Fri, Feb 3, 2017 at 9:16 AM, Bruce Ashfield <bruce.ashfield@gmail.com<ma=
ilto:bruce.ashfield@gmail.com>> wrote:=0A=
=0A=
=0A=
On Fri, Feb 3, 2017 at 5:49 AM, Awais Belal <awais_belal@mentor.com<mailto:=
awais_belal@mentor.com>> wrote:=0A=
In some cases it is seen that kernel_checkout and=0A=
validate_branches are run again in simultaneous builds.=0A=
During do_patch the kgit-s2q mechanism creates and=0A=
checks for the kgit-s2q.last file inside the .git=0A=
directory, finds a fence post and starts picking up=0A=
patches after that. This can create trouble as=0A=
validate_branches checks out the HEAD of the branch=0A=
and so the patches should be reapplied rather than=0A=
skipped due to finding of the fence post.=0A=
=0A=
Indeed. I can see how this could happen. I added the mechanism to ensure=0A=
that multiple runs (forced or not) didn't re-patch the tree (since the tool=
s no=0A=
longer do an auto-resume detection).=0A=
=0A=
At that time, I tried to run the paths and make sure that the sentinel file=
=0A=
couldn't cause this sort of problem, but clearly there is a case.=0A=
=0A=
I'll grab this patch and modify it a bit so the script can clear the file i=
tself=0A=
(that way if the format changes again, we don't have to tweak the bbclass).=
=0A=
=0A=
I'll float that patch by you, if that is ok, so you can add a Signed-off-by=
=0A=
(since the work on finding the issue deserves credit on the patch itself).=
=0A=
=0A=
Cheers,=0A=
=0A=
Bruce=0A=
=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com<mailto:awais_belal@mento=
r.com>>=0A=
---=0A=
 meta/classes/kernel-yocto.bbclass | 4 ++++=0A=
 1 file changed, 4 insertions(+)=0A=
=0A=
diff --git a/meta/classes/kernel-yocto.bb<http://kernel-yocto.bb>class b/me=
ta/classes/kernel-yocto.bb<http://kernel-yocto.bb>class=0A=
index 5cfd8af..131c48a 100644=0A=
--- a/meta/classes/kernel-yocto.bb<http://kernel-yocto.bb>class=0A=
+++ b/meta/classes/kernel-yocto.bb<http://kernel-yocto.bb>class=0A=
@@ -350,6 +350,10 @@ do_validate_branches() {=0A=
                        current_branch=3D`git rev-parse --abbrev-ref HEAD`=
=0A=
                        git branch "$current_branch-orig"=0A=
                        git reset --hard ${force_srcrev}=0A=
+                       # We've checked out HEAD, make sure we cleanup kgit=
-s2q fence post check=0A=
+                       # so the patches are applied as expected otherwise =
no patching=0A=
+                       # would be done in some corner cases.=0A=
+                       rm -rf ${S}/.git/kgit-s2q.last=0A=
                fi=0A=
        fi=0A=
 }=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
=0A=
=0A=
=0A=
--=0A=
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"=0A=
=0A=
=0A=
=0A=
--=0A=
"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"=0A=

