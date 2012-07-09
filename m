Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <iyadkq@gmail.com>) id 1So4zo-00066d-4z
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 05:50:48 +0200
Received: by obcva7 with SMTP id va7so18799262obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 20:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EM5J5KSdh+ctmnVhO+ttaFjc+fDjca1lFFfxkeQGT+w=;
	b=n/tSC+qoC8ufyRPzEzJHV0Oh07+DwtK8gyvzy2Fag1NTqIjfclqCgAkKHcgTyOyxo1
	pOr40fuMaby8Cu+gwo8oGUz8ebSSQsrZ974Xy7N+IZy0yZA7aP016r8h5WjggLWH3smm
	rI1u786dhDHqRbyd/ylAu44Kh5VJ7SdFQGg4QOrJZNBE3Pi5AbDpMbmd66lRLESHqJyJ
	/XN3J4m0N8Nq60TXLsQ7jMaV6aKE/Us+vA882xH7g1yTJ6ySk5hvJxtKlP3xTIV+BCsX
	mQedtsh87OqbKT5ILmW1AwPfyQiP3GCLyN42cn16EbBfqwAlzizkN8D6B0PFnVXcKqR0
	C8ng==
MIME-Version: 1.0
Received: by 10.60.30.170 with SMTP id t10mr30766037oeh.10.1341805178476; Sun,
	08 Jul 2012 20:39:38 -0700 (PDT)
Received: by 10.182.124.106 with HTTP; Sun, 8 Jul 2012 20:39:38 -0700 (PDT)
In-Reply-To: <20120707023136.GH3708@jama.jama.net>
References: <1341615750-25579-1-git-send-email-iyadkq@gmail.com>
	<20120707023136.GH3708@jama.jama.net>
Date: Sun, 8 Jul 2012 20:39:38 -0700
Message-ID: <CADL+O9vNrqgVcwHOCbtFTUAV3fOe3hnH5PwGK96+fGgQKQcV1g@mail.gmail.com>
From: Iyad Qumei <iyadkq@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATH] fix build failure due to lic_files_chksum mismatch. The correction unpacks the source in the correct directory.
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
X-List-Received-Date: Mon, 09 Jul 2012 03:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> This is default, so it shouldn't change anything (and it checks
> lic_files fine here).

in my case, the error is caused by the fact the oe-core is setting up
the work-directory under i586-xx ( the architecture area ) while the
unpacking was done in qemux86-xxx ( the machine area ).  The only way
to fix it was to explicitly define the S= in the recipe.

Thanks for the feedback.
Iyad

On Fri, Jul 6, 2012 at 7:31 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jul 06, 2012 at 04:02:30PM -0700, Iyad Qumei wrote:
>> Signed-off-by: Iyad Qumei <iyadkq@gmail.com>
>> ---
>>  meta/recipes-core/netbase/netbase_5.0.bb |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
>> index 3aea874..ad80ef6 100644
>> --- a/meta/recipes-core/netbase/netbase_5.0.bb
>> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
>> @@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
>>  SECTION = "base"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>> -PR = "r0"
>> +PR = "r1"
>>
>>  inherit update-rc.d
>>
>> @@ -17,6 +17,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
>>             file://interfaces \
>>             file://nfsroot"
>>
>> +S = "${WORKDIR}/${P}"
>> +
>
> This is default, so it shouldn't change anything (and it checks
> lic_files fine here).
>
> Cheers,
>
>>  SRC_URI[md5sum] = "a379d9199d44d817543eddc211a29b70"
>>  SRC_URI[sha256sum] = "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b7dc7122308afa9dc"
>>
>> --
>> 1.7.4.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


