Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id A423161895
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:29:45 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 737281C0028;
	Fri, 28 Feb 2020 11:29:45 +1300 (NZDT)
To: Joshua Watt <jpewhacker@gmail.com>
References: <8b666dc3-e5a6-0417-82bd-2b15190d223f@gmail.com>
	<ef5aea58-ef88-61c1-b614-88476f5e747c@gmail.com>
	<0319e121-7546-e456-50d6-4b224e87363f@taitradio.com>
	<cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com>
	<e2a17625-3a90-6482-5af3-61a82ac04dcc@gmail.com>
	<baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com>
	<79e170f8-e6ae-f87b-70ea-f67fb870a28b@gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <47d8bb87-b3be-1789-c1cb-124b446462d8@taitradio.com>
Date: Fri, 28 Feb 2020 11:29:45 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <79e170f8-e6ae-f87b-70ea-f67fb870a28b@gmail.com>
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
X-List-Received-Date: Thu, 27 Feb 2020 22:29:46 -0000
Content-Type: multipart/alternative;
	boundary="------------964F400325F6128021DB8BF3"
Content-Language: en-GB

--------------964F400325F6128021DB8BF3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28/02/20 10:49 am, Joshua Watt wrote:

>
> On 2/27/20 3:22 PM, Douglas Royds wrote:
>>
>> On 28/02/20 5:45 am, Joshua Watt wrote:
>>
>>> On 2/27/20 9:01 AM, Joshua Watt wrote:
>>>> On 2/26/20 11:46 PM, Douglas Royds wrote:
>>>>>
>>>>> On 26/02/20 4:53 am, Jacob Kroon wrote:
>>>>>
>>>>>> On 2/24/20 8:25 AM, Jacob Kroon wrote:
>>>>>>> Hi Douglas,
>>>>>>>
>>>>>>> You updated a comment in reproducible_build.bbclass, commit=20
>>>>>>> e7b891b76954c784f5a93bd0a1c91315673ce40d:
>>>>>>>
>>>>>>>> -# Once the value of SOURCE_DATE_EPOCH is determined, it is=20
>>>>>>>> stored in the recipe's ${SDE_FILE}.
>>>>>>>> +# Once the value of SOURCE_DATE_EPOCH is determined, it is=20
>>>>>>>> stored in the recipe's SDE_FILE.
>>>>>>>> +# If none of these mechanisms are suitable, replace the=20
>>>>>>>> do_deploy_source_date_epoch task
>>>>>>>> +# with recipe-specific functionality to write the appropriate=20
>>>>>>>> SOURCE_DATE_EPOCH into the SDE_FILE.
>>>>>>>> +#
>>>>>>>
>>>>>>> But I can't really get this to work. What did work for me was to=20
>>>>>>> replace "do_create_source_date_epoch_stamp()" in my recipe:
>>>>>>>
>>>>>>> do_create_source_date_epoch_stamp() {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${SDE_DIR}
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 date -d "1981-03-03" "+%s" > ${SDE_FILE}
>>>>>>> }
>>>>>>>
>>>>>>> What is the intended way to achieve the thing I'm trying to do=20
>>>>>>> here ?
>>>>>>>
>>>>>>
>>>>>> FYI, JPEW has a proposed patch here
>>>>>>
>>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Djpew=
/reproducible&id=3Dd091d2aa53ea417f70c10f5ce89151820c3db9ce=20
>>>>>>
>>>>>>
>>>>>> for allowing a recipe to just set SOURCE_DATE_EPOCH directly.
>>>>>>
>>>>>> But maybe that currently is at odds with SOURCE_DATE_EPOCH being=20
>>>>>> in BB_HASHBASE_WHITELIST ?
>>>>>>
>>>>>> /Jacob
>>>>>
>>>>>
>>>>> On the surface of it, my comment appears to be just wrong: It does=20
>>>>> make sense to replace do_create_source_date_epoch_stamp() as you=20
>>>>> suggest.
>>>>>
>>>>> Joshua's proposed patch looks promising:
>>>>>
>>>>>   * Should the new function not be called first, so that it takes
>>>>>     priority over the git, known files, and youngest file
>>>>>     functions? If someone has explicitly set SOURCE_DATE_EPOCH,
>>>>>     then they want it to take priority.
>>>>>
>>>> Having that be the first option makes sense. The only case in which=20
>>>> that might not work, is if a recipe does something like:
>>>>
>>>> =C2=A0SOURCE_DATE_EPOCH =3D "${@my_awesome_sde_calculation(d)}"
>>>>
>>>> e.g. uses a function to get the SDE instead of setting to a fixed=20
>>>> value, but that's probably going to be extremely rare.
>>>>
>>>>
>>>>>  *
>>>>>
>>>>>
>>>>>
>>>>>   * As you observe, SOURCE_DATE_EPOCH would need to be removed
>>>>>     from BB_HASHBASE_WHITELIST. I'm not sure why it was in the
>>>>>     whitelist in the first place.
>>>>>
>>>> I'm not sure why exactly it is whitelisted; I didn't write the=20
>>>> original code that whitelisted it, but I've CC'd Juro in case he=20
>>>> happens to remember.
>>>>
>>> After a discussion with Richard, we figured out why=20
>>> SOURCE_DATE_EPOCH has to be whitelisted. The value of the variable=20
>>> *must* be calculable at parse time before any task is ran, but in=20
>>> practice it's value is only available once the=20
>>> __source_date_epoch.txt file is present, which is after parsing.=20
>>> This causes the taskhash to be calculated differently during parsing=20
>>> and task execution which causes taskhash mismatch errors.
>>>
>>
>> True.
>>
>> What to do? Would it work to use a different non-whitelisted variable=20
>> in the recipe, eg. SOURCE_DATE_EPOCH_FIXED?
>>
>
> Ya, that would work. You'd have to figure out how to get the variable=20
> to be included in each taskhash even though it's not directly=20
> referenced, but I'm sure that's possible.
>
>
> Another option that's at lot more "magic" would be something like=20
> this:=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Djpew/repr=
oducible&id=3D2b524916cf35238ff3deea34017e8a4cd73926cd=20
>
>
> That's really weird, and I'm not sure I like it, but worth a thought.
>
If it works, it's good. I like the fact that the user can just set=20
SOURCE_DATE_EPOCH directly in their recipe.

How about ...

    BB_HASHBASE_WHITELIST +=3D "${@'SOURCE_DATE_EPOCH' if not
    source_date_epoch_var(d) else ''}"


--------------964F400325F6128021DB8BF3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>On 28/02/20 10:49 am, Joshua Watt wrote:
      <blockquote type=3D"cite">
        <meta http-equiv=3D"Content-Type" content=3D"text/html;
          charset=3DUTF-8">
        <p><br>
        </p>
        <div class=3D"moz-cite-prefix">On 2/27/20 3:22 PM, Douglas Royds
          wrote:<br>
        </div>
        <blockquote type=3D"cite"
          cite=3D"mid:baae3c8f-219f-03eb-6f6c-a488ae22230b@taitradio.com"=
>
          <meta http-equiv=3D"Content-Type" content=3D"text/html;
            charset=3DUTF-8">
          <p>On 28/02/20 5:45 am, Joshua Watt wrote: </p>
          <blockquote type=3D"cite">
            <meta http-equiv=3D"Content-Type" content=3D"text/html;
              charset=3DUTF-8">
            <div class=3D"moz-cite-prefix">On 2/27/20 9:01 AM, Joshua Wat=
t
              wrote:<br>
            </div>
            <blockquote type=3D"cite"
              cite=3D"mid:cce62b8e-b135-6daa-0c47-3e91955d248c@gmail.com"=
>
              <meta http-equiv=3D"Content-Type" content=3D"text/html;
                charset=3DUTF-8">
              <div class=3D"moz-cite-prefix">On 2/26/20 11:46 PM, Douglas
                Royds wrote:<br>
              </div>
              <blockquote type=3D"cite"
                cite=3D"mid:0319e121-7546-e456-50d6-4b224e87363f@taitradi=
o.com">
                <meta http-equiv=3D"Content-Type" content=3D"text/html;
                  charset=3DUTF-8">
                <p>On 26/02/20 4:53 am, Jacob Kroon wrote: </p>
                <blockquote type=3D"cite">On 2/24/20 8:25 AM, Jacob Kroon
                  wrote: <br>
                  <blockquote type=3D"cite">Hi Douglas, <br>
                    <br>
                    You updated a comment in reproducible_build.bbclass,
                    commit e7b891b76954c784f5a93bd0a1c91315673ce40d: <br>
                    <br>
                    <blockquote type=3D"cite">-# Once the value of
                      SOURCE_DATE_EPOCH is determined, it is stored in
                      the recipe's ${SDE_FILE}. <br>
                      +# Once the value of SOURCE_DATE_EPOCH is
                      determined, it is stored in the recipe's SDE_FILE.
                      <br>
                      +# If none of these mechanisms are suitable,
                      replace the do_deploy_source_date_epoch task <br>
                      +# with recipe-specific functionality to write the
                      appropriate SOURCE_DATE_EPOCH into the SDE_FILE. <b=
r>
                      +# <br>
                    </blockquote>
                    <br>
                    But I can't really get this to work. What did work
                    for me was to replace
                    "do_create_source_date_epoch_stamp()" in my recipe:
                    <br>
                    <br>
                    do_create_source_date_epoch_stamp() { <br>
                    =C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${SDE_DIR} <br>
                    =C2=A0=C2=A0=C2=A0=C2=A0 date -d "1981-03-03" "+%s" &=
gt; ${SDE_FILE} <br>
                    } <br>
                    <br>
                    What is the intended way to achieve the thing I'm
                    trying to do here ? <br>
                    <br>
                  </blockquote>
                  <br>
                  FYI, JPEW has a proposed patch here <br>
                  <br>
                  <a class=3D"moz-txt-link-freetext"
href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Djpe=
w/reproducible&amp;id=3Dd091d2aa53ea417f70c10f5ce89151820c3db9ce"
                    moz-do-not-send=3D"true">http://git.yoctoproject.org/=
cgit.cgi/poky-contrib/commit/?h=3Djpew/reproducible&amp;id=3Dd091d2aa53ea=
417f70c10f5ce89151820c3db9ce</a>
                  <br>
                  <br>
                  for allowing a recipe to just set SOURCE_DATE_EPOCH
                  directly. <br>
                  <br>
                  But maybe that currently is at odds with
                  SOURCE_DATE_EPOCH being in BB_HASHBASE_WHITELIST ? <br>
                  <br>
                  /Jacob <br>
                </blockquote>
                <p><br>
                </p>
                <p>On the surface of it, my comment appears to be just
                  wrong: It does make sense to replace
                  do_create_source_date_epoch_stamp() as you suggest.</p>
                <p>Joshua's proposed patch looks promising:</p>
                <ul>
                  <li>Should the new function not be called first, so
                    that it takes priority over the git, known files,
                    and youngest file functions? If someone has
                    explicitly set SOURCE_DATE_EPOCH, then they want it
                    to take priority.<br>
                  </li>
                </ul>
              </blockquote>
              <p>Having that be the first option makes sense. The only
                case in which that might not work, is if a recipe does
                something like:</p>
              <p>=C2=A0SOURCE_DATE_EPOCH =3D
                "${@my_awesome_sde_calculation(d)}"</p>
              <p>e.g. uses a function to get the SDE instead of setting
                to a fixed value, but that's probably going to be
                extremely rare.<br>
              </p>
              <p><br>
              </p>
              <blockquote type=3D"cite"
                cite=3D"mid:0319e121-7546-e456-50d6-4b224e87363f@taitradi=
o.com">
                <ul>
                  <li> <br>
                  </li>
                  <li>As you observe, SOURCE_DATE_EPOCH would need to be
                    removed from BB_HASHBASE_WHITELIST. I'm not sure why
                    it was in the whitelist in the first place.<br>
                  </li>
                </ul>
              </blockquote>
              <p>I'm not sure why exactly it is whitelisted; I didn't
                write the original code that whitelisted it, but I've
                CC'd Juro in case he happens to remember.<br>
              </p>
            </blockquote>
            <p>After a discussion with Richard, we figured out why
              SOURCE_DATE_EPOCH has to be whitelisted. The value of the
              variable *must* be calculable at parse time before any
              task is ran, but in practice it's value is only available
              once the __source_date_epoch.txt file is present, which is
              after parsing. This causes the taskhash to be calculated
              differently during parsing and task execution which causes
              taskhash mismatch errors.</p>
          </blockquote>
          <p><br>
          </p>
          <p>True.</p>
          <p>What to do? Would it work to use a different
            non-whitelisted variable in the recipe, eg.
            SOURCE_DATE_EPOCH_FIXED?<br>
          </p>
        </blockquote>
        <p><br>
        </p>
        <p>Ya, that would work. You'd have to figure out how to get the
          variable to be included in each taskhash even though it's not
          directly referenced, but I'm sure that's possible.</p>
        <p><br>
        </p>
        <p>Another option that's at lot more "magic" would be something
          like this:
          <a class=3D"moz-txt-link-freetext"
href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Djpe=
w/reproducible&amp;id=3D2b524916cf35238ff3deea34017e8a4cd73926cd">http://=
git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Djpew/reproducible&=
amp;id=3D2b524916cf35238ff3deea34017e8a4cd73926cd</a>
          <br>
        </p>
        <p>That's really weird, and I'm not sure I like it, but worth a
          thought.<br>
        </p>
      </blockquote>
    </p>
    <p>If it works, it's good. I like the fact that the user can just
      set SOURCE_DATE_EPOCH directly in their recipe.<br>
    </p>
    <p>How about ...</p>
    <blockquote>
      <p>BB_HASHBASE_WHITELIST +=3D "${@'SOURCE_DATE_EPOCH' if not
        source_date_epoch_var(d) else ''}"</p>
    </blockquote>
  </body>
</html>

--------------964F400325F6128021DB8BF3--
