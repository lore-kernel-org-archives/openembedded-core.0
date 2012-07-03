Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sm8ZV-0004rs-OK
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 21:15:38 +0200
Received: by pbbrq2 with SMTP id rq2so9470753pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=TEFfxk5M14d0xkVTbZtQGclHbXc+ZifIm74seZkYiK8=;
	b=k7zmkCW9y7NiXPB0BZ2dYf1CsNkprS2jNYQk/SgOYQdRGnkZITtsGi0NrOowXc2xpF
	l8UhF7QSDVptiRns4TRufECIrsh2lrR0IyGauIp4m7nZdZ4YTUScqHrPqtQbRN9yr1Np
	lBcMT9VouIrneuABsFADeOqdjtmbQ+7IF+TTMYz4Cm9bKwWiiTyz3awdnpwRTf0SSIpX
	vggfszgSHMMgvGCjsl2Cfrn765c3AXSnp5HngSlhHeN73IemvWawQyxqKQ1xjZJ7FfGZ
	c9ZP8ce8O5GMmeGGo0l0G2nkx8gPblw6t5jxIjkq2/hz20XX+E4iDtheMNrgxjh5txIQ
	dIgQ==
Received: by 10.68.130.169 with SMTP id of9mr1269476pbb.82.1341342269550;
	Tue, 03 Jul 2012 12:04:29 -0700 (PDT)
Received: from [10.0.0.165] ([96.24.66.215])
	by mx.google.com with ESMTPS id ka5sm16066343pbb.37.2012.07.03.12.04.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 12:04:28 -0700 (PDT)
References: <1341276037-32076-1-git-send-email-sgw@linux.intel.com>
	<CABcZANnVy0B_wFyVhxz_JsipTf_PXL2ZzLU4hnNGbObDbZRDLw@mail.gmail.com>
	<4FF3280B.3020008@linux.intel.com>
In-Reply-To: <4FF3280B.3020008@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <25E47B94-1ECC-40D1-B0B4-15793B6F8B7D@gmail.com>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jul 2012 12:04:25 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v2] package.bbclass: enable the use of package_qa_handle_error
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
X-List-Received-Date: Tue, 03 Jul 2012 19:15:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Jul 3, 2012, at 10:12 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/03/2012 06:55 AM, Chris Larson wrote:
>> On Mon, Jul 2, 2012 at 5:40 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>>> This will allow the reporting of these errors as either WARNINGs (defaul=
t)
>>> or ERRORs if installed_vs_shipped is added to the ERROR_QA of the policy=

>>> file (such as a<distro_name>.conf file.
>>>=20
>>> V2: found the code I had intended to send instead of that other junk,
>>>     was just not watching what I pushed on that one, sorry. (this is edi=
t in
>>>     no in the actual commit message)
>>>=20
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>>  meta/classes/package.bbclass |   11 ++++++++---
>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass=

>>> index 0b98c6b..ff2ec96 100644
>>> --- a/meta/classes/package.bbclass
>>> +++ b/meta/classes/package.bbclass
>>> @@ -988,9 +988,14 @@ python populate_packages () {
>>>                                 unshipped.append(path)
>>>=20
>>>         if unshipped !=3D []:
>>> -               bb.warn("For recipe %s, the following files/directories w=
ere installed but not shipped in any package:" % pn)
>>> -               for f in unshipped:
>>> -                       bb.warn("  " + f)
>>> +               msg =3D pn + ": Files/directories were installed but not=
 shipped"
>>> +               skip =3D (d.getVar('INSANE_SKIP_' + pn, True) or "").spl=
it()
>>> +               if "installed_vs_shipped" in skip:
>>> +                       bb.note("Package %s skipping QA tests: installed=
_vs_shipped" % pn)
>>> +               else:
>>> +                       package_qa_handle_error("installed_vs_shipped", m=
sg, d)
>>> +                       for f in unshipped:
>>> +                               package_qa_handle_error("installed_vs_sh=
ipped", "  " + f, d)
>>=20
>> Hmm, I wonder if this is best, or if it should assemble a single
>> message with newlines separating the files. *thinks*
>=20
> So that would cause only 1 ERROR or WARNING count, vs N ERRORs or WARNIGS i=
n the final count for every file that is listed, I think it's good to have t=
he larger count it signal's something went wrong if that count increases gre=
atly when a recipe is changed.

If its flagged as error then count really doesn't matter and if it is warnin=
g then user doesnt care=20
But reporting all together may be better

>=20
> Could work either way, but I like the exaggerated count.
>=20
> Sau!
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


