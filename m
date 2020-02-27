Return-Path: <douglas.royds@taitradio.com>
X-Greylist: delayed 525 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Feb 2020 05:54:52 UTC
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id B1C0561178
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:54:52 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id D050A22027A;
	Thu, 27 Feb 2020 18:46:05 +1300 (NZDT)
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
	<ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
Date: Thu, 27 Feb 2020 18:46:05 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Overriding SDE_FILE
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
X-List-Received-Date: Thu, 27 Feb 2020 05:55:03 -0000
Content-Type: multipart/alternative;
	boundary="------------94825962FE03A8A47D243EAD"
Content-Language: en-GB

--------------94825962FE03A8A47D243EAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26/02/20 4:53 am, Jacob Kroon wrote:

> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>> Hi Douglas,
>>
>> You updated a comment in reproducible_build.bbclass, commit=20
>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>
>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is stored=20
>>> in the recipe's ${SDE_FILE}.
>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is stored=20
>>> in the recipe's SDE_FILE.
>>> +# If none of these mechanisms are suitable, replace the=20
>>> do_deploy_source_date_epoch task
>>> +# with recipe-specific functionality to write the appropriate=20
>>> SOURCE_DATE_EPOCH into the SDE_FILE.
>>> +#
>>
>> But I can't really get this to work. What did work for me was to=20
>> replace "do_create_source_date_epoch_stamp()" in my recipe:
>>
>> do_create_source_date_epoch_stamp() {
>> =C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${SDE_DIR}
>> =C2=A0=C2=A0=C2=A0=C2=A0 date -d "1981-03-03" "+%s" > ${SDE_FILE}
>> }
>>
>> What is the intended way to achieve the thing I'm trying to do here ?
>>
>
> FYI, JPEW has a proposed patch here
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Djpew/repr=
oducible&id=3Dd091d2aa53ea417f70c10f5ce89151820c3db9ce=20
>
>
> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>
> But maybe that currently is at odds with SOURCE_DATE_EPOCH being in=20
> BB_HASHBASE_WHITELIST ?
>
> /Jacob


On the surface of it, my comment appears to be just wrong: It does make=20
sense to replace do_create_source_date_epoch_stamp() as you suggest.

Joshua's proposed patch looks promising:

  * Should the new function not be called first, so that it takes
    priority over the git, known files, and youngest file functions? If
    someone has explicitly set SOURCE_DATE_EPOCH, then they want it to
    take priority.
  * As you observe, SOURCE_DATE_EPOCH would need to be removed from
    BB_HASHBASE_WHITELIST. I'm not sure why it was in the whitelist in
    the first place.


--------------94825962FE03A8A47D243EAD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>On 26/02/20 4:53 am, Jacob Kroon wrote:
      <blockquote type=3D"cite">On 2/24/20 8:25 AM, Jacob Kroon wrote:
        <br>
        <blockquote type=3D"cite">Hi Douglas,
          <br>
          <br>
          You updated a comment in reproducible_build.bbclass, commit
          e7b891b76954c784f5a93bd0a1c91315673ce40d:
          <br>
          <br>
          <blockquote type=3D"cite">-# Once the value of SOURCE_DATE_EPOC=
H
            is determined, it is stored in the recipe's ${SDE_FILE}.
            <br>
            +# Once the value of SOURCE_DATE_EPOCH is determined, it is
            stored in the recipe's SDE_FILE.
            <br>
            +# If none of these mechanisms are suitable, replace the
            do_deploy_source_date_epoch task
            <br>
            +# with recipe-specific functionality to write the
            appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
            <br>
            +#
            <br>
          </blockquote>
          <br>
          But I can't really get this to work. What did work for me was
          to replace "do_create_source_date_epoch_stamp()" in my recipe:
          <br>
          <br>
          do_create_source_date_epoch_stamp() {
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${SDE_DIR}
          <br>
          =C2=A0=C2=A0=C2=A0=C2=A0 date -d "1981-03-03" "+%s" &gt; ${SDE_=
FILE}
          <br>
          }
          <br>
          <br>
          What is the intended way to achieve the thing I'm trying to do
          here ?
          <br>
          <br>
        </blockquote>
        <br>
        FYI, JPEW has a proposed patch here
        <br>
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://git.yoctoproject.org/cg=
it.cgi/poky-contrib/commit/?h=3Djpew/reproducible&amp;id=3Dd091d2aa53ea41=
7f70c10f5ce89151820c3db9ce">http://git.yoctoproject.org/cgit.cgi/poky-con=
trib/commit/?h=3Djpew/reproducible&amp;id=3Dd091d2aa53ea417f70c10f5ce8915=
1820c3db9ce</a>
        <br>
        <br>
        for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
        <br>
        <br>
        But maybe that currently is at odds with SOURCE_DATE_EPOCH being
        in BB_HASHBASE_WHITELIST ?
        <br>
        <br>
        /Jacob
        <br>
      </blockquote>
    </p>
    <p><br>
    </p>
    <p>On the surface of it, my comment appears to be just wrong: It
      does make sense to replace do_create_source_date_epoch_stamp() as
      you suggest.</p>
    <p>Joshua's proposed patch looks promising:</p>
    <ul>
      <li>Should the new function not be called first, so that it takes
        priority over the git, known files, and youngest file functions?
        If someone has explicitly set SOURCE_DATE_EPOCH, then they want
        it to take priority.<br>
      </li>
      <li>As you observe, SOURCE_DATE_EPOCH would need to be removed
        from BB_HASHBASE_WHITELIST. I'm not sure why it was in the
        whitelist in the first place.<br>
      </li>
    </ul>
  </body>
</html>

--------------94825962FE03A8A47D243EAD--
