Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C5DC27C6E
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:39:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.40705.1718566796490628833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDjXGmAK;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f225ac23bso3640402f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718566794; x=1719171594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qN1xInct08gjxMM+eeJHMCsXqG2cuYpMJe66z28T+r0=;
        b=NDjXGmAKpxUTJ3TyzNpUB9gcSzLgLzMyhJDdWITVSzcfBS80yoP7OJw18lNBiPBRyR
         HcJyUKDLIKFybqBc4kqrmI+J+5xjzWYDnVZEfFYejHA+G3JE4+Rfpn9guqMK9n51exZ/
         PH7icVMKeDRdXHyfXzRtG71a1LQNmko+ahQ0YQ10bgVpzFed5LLocxb+lklXv8+4EX5q
         zW/EHt8HKUO14WE5NbhXXMikQg3/MCLiJCXTk2M5v9pDy/f7oQ4fNA42cOLiupW780zF
         E7vTr/4142QPzKczIlBHCgiGOVp0FuL3yvX7PyPYJgyeNIZbU40v8CKhnQskaNlUvDQ4
         GkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718566794; x=1719171594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN1xInct08gjxMM+eeJHMCsXqG2cuYpMJe66z28T+r0=;
        b=k/oI/CF7pHB6tA2H10GyS/hZ9MiXY0MN4ph2ah4XJkkb6edYX13EQ3FHG0GIS8wVxM
         lu6W82BzxnkM3Nr7d1eiOHrm89gpQMdf3kuC5IpsVXBMsu9yXPNnEEk8IgkJ78gY2+gi
         78iXFZaHdoUJ7d96ORymZsAuCKItzWT4nHFTm8M9K6QwENa741jVNaB1zIAXUKyWZY5n
         b/4OR9O4tiNCgm0125bbFS6SwlyogFYj/MVf9ng5YuO/hNw1mzKJ662Th7mrux8bwIWW
         VtnyuOEqhEWi/C+h2PuYum50P2HM5KtdhIGx2d1MfYHKKaR2VurUiVPE+oQ+lBQb4dvk
         pQ5Q==
X-Gm-Message-State: AOJu0YyodOsYI2RKJUn9MZaETSVpowC+CDOk0NKrOdI6w//LBF3uzk33
	7cDmWdStgzoR48viRgM1QXzHqC0HyqadmJL4Z3BlFRO5kG8ax7/vSS/dOkWV
X-Google-Smtp-Source: AGHT+IEDNtvZjRC+D471RKLoEGK1QuWUHqSGiPUxzVr90lw8gT83Rltnp3Loa8rYTjA5tiBLFItDug==
X-Received: by 2002:adf:efcb:0:b0:35f:1ed7:f1fd with SMTP id ffacd0b85a97d-3607a7606f1mr6632243f8f.19.1718566794227;
        Sun, 16 Jun 2024 12:39:54 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509353csm10252932f8f.22.2024.06.16.12.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 12:39:53 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-mako: added ptest
Date: Sun, 16 Jun 2024 21:39:32 +0200
Message-Id: <20240616193932.1572432-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 19:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200782

root@qemux86-64:~# ptest-runner python3-mako
START: ptest-runner
2024-06-16T19:21
BEGIN: /usr/lib/python3-mako/ptest
SKIP: test/ext/test_babelplugin.py:PluginExtractTest.test_parse_python_expression # SKIP babel not installed: skipping babelplugin test
SKIP: test/ext/test_babelplugin.py:PluginExtractTest.test_python_gettext_call # SKIP babel not installed: skipping babelplugin test
SKIP: test/ext/test_babelplugin.py:PluginExtractTest.test_translator_comment # SKIP babel not installed: skipping babelplugin test
SKIP: test/ext/test_babelplugin.py:MakoExtractTest.test_extract # SKIP babel not installed: skipping babelplugin test
SKIP: test/ext/test_babelplugin.py:MakoExtractTest.test_extract_utf8 # SKIP babel not installed: skipping babelplugin test
SKIP: test/ext/test_babelplugin.py:MakoExtractTest.test_extract_cp1251 # SKIP babel not installed: skipping babelplugin test
SKIP: test/ext/test_linguaplugin.py:MakoExtractTest.test_extract # SKIP lingua not installed: skipping linguaplugin test
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_2
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_3
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_4
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_5
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_6
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_7
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_8
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_9
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_10
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_11
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_12
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_13
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_14
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_16
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_17
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_18
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_19
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_20
PASS: test/test_ast.py:AstParseTest.test_locate_identifiers_21
PASS: test/test_ast.py:AstParseTest.test_no_global_imports
PASS: test/test_ast.py:AstParseTest.test_python_fragment
PASS: test/test_ast.py:AstParseTest.test_argument_list
PASS: test/test_ast.py:AstParseTest.test_function_decl
PASS: test/test_ast.py:AstParseTest.test_function_decl_2
PASS: test/test_ast.py:AstParseTest.test_function_decl_3
PASS: test/test_ast.py:AstParseTest.test_expr_generate
PASS: test/test_block.py:BlockTest.test_anonymous_block_namespace_raises
PASS: test/test_block.py:BlockTest.test_anonymous_block_in_call
PASS: test/test_block.py:BlockTest.test_named_block_in_call
PASS: test/test_block.py:BlockTest.test_name_collision_blocks_toplevel
PASS: test/test_block.py:BlockTest.test_name_collision_blocks_nested_block
PASS: test/test_block.py:BlockTest.test_name_collision_blocks_nested_def
PASS: test/test_block.py:BlockTest.test_name_collision_block_def_toplevel
PASS: test/test_block.py:BlockTest.test_name_collision_def_block_toplevel
PASS: test/test_block.py:BlockTest.test_named_block_renders
PASS: test/test_block.py:BlockTest.test_inherited_block_no_render
PASS: test/test_block.py:BlockTest.test_no_named_in_def
PASS: test/test_block.py:BlockTest.test_inherited_block_nested_both
PASS: test/test_block.py:BlockTest.test_inherited_block_nested_inner_only
PASS: test/test_block.py:BlockTest.test_noninherited_block_no_render
PASS: test/test_block.py:BlockTest.test_no_conflict_nested_one
PASS: test/test_block.py:BlockTest.test_nested_dupe_names_raise
PASS: test/test_block.py:BlockTest.test_two_levels_one
PASS: test/test_block.py:BlockTest.test_filter
PASS: test/test_block.py:BlockTest.test_anon_in_named
PASS: test/test_block.py:BlockTest.test_named_in_anon
PASS: test/test_block.py:BlockTest.test_anon_in_anon
PASS: test/test_block.py:BlockTest.test_named_in_named
PASS: test/test_block.py:BlockTest.test_iteration
PASS: test/test_block.py:BlockTest.test_conditional
PASS: test/test_block.py:BlockTest.test_block_overridden_by_def
PASS: test/test_block.py:BlockTest.test_def_overridden_by_block
PASS: test/test_block.py:BlockTest.test_block_args
PASS: test/test_block.py:BlockTest.test_block_variables_contextual
PASS: test/test_block.py:BlockTest.test_block_args_contextual
PASS: test/test_block.py:BlockTest.test_block_pageargs_contextual
PASS: test/test_block.py:BlockTest.test_block_pageargs
PASS: test/test_cache.py:CacheTest.test_def
PASS: test/test_cache.py:CacheTest.test_cache_enable
PASS: test/test_cache.py:CacheTest.test_nested_def
PASS: test/test_cache.py:CacheTest.test_page
PASS: test/test_cache.py:CacheTest.test_dynamic_key_with_context
PASS: test/test_cache.py:CacheTest.test_dynamic_key_with_funcargs
PASS: test/test_cache.py:CacheTest.test_dynamic_key_with_imports
PASS: test/test_cache.py:CacheTest.test_fileargs_implicit
PASS: test/test_cache.py:CacheTest.test_fileargs_deftag
PASS: test/test_cache.py:CacheTest.test_fileargs_pagetag
PASS: test/test_cache.py:CacheTest.test_args_complete
PASS: test/test_cache.py:CacheTest.test_fileargs_lookup
PASS: test/test_cache.py:CacheTest.test_buffered
PASS: test/test_cache.py:CacheTest.test_load_from_expired
PASS: test/test_cache.py:CacheTest.test_namespace_access
PASS: test/test_cache.py:CacheTest.test_lookup
PASS: test/test_cache.py:CacheTest.test_invalidate
PASS: test/test_cache.py:CacheTest.test_custom_args_def
PASS: test/test_cache.py:CacheTest.test_custom_args_block
PASS: test/test_cache.py:CacheTest.test_custom_args_page
PASS: test/test_cache.py:CacheTest.test_pass_context
SKIP: test/test_cache.py:BeakerCacheTest.test_def # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_cache_enable # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_nested_def # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_page # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_dynamic_key_with_context # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_dynamic_key_with_funcargs # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_dynamic_key_with_imports # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_fileargs_implicit # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_fileargs_deftag # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_fileargs_pagetag # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_args_complete # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_fileargs_lookup # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_buffered # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_load_from_expired # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_namespace_access # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_lookup # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_invalidate # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_custom_args_def # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_custom_args_block # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_custom_args_page # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_pass_context # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_cache_uses_current_context # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:BeakerCacheTest.test_region # SKIP Beaker is required for these tests.
SKIP: test/test_cache.py:DogpileCacheTest.test_def # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_cache_enable # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_nested_def # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_page # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_dynamic_key_with_context # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_dynamic_key_with_funcargs # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_dynamic_key_with_imports # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_fileargs_implicit # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_fileargs_deftag # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_fileargs_pagetag # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_args_complete # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_fileargs_lookup # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_buffered # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_load_from_expired # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_namespace_access # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_lookup # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_invalidate # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_custom_args_def # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_custom_args_block # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_custom_args_page # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_pass_context # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_cache_uses_current_context # SKIP dogpile.cache is required to run these tests
SKIP: test/test_cache.py:DogpileCacheTest.test_region # SKIP dogpile.cache is required to run these tests
PASS: test/test_call.py:CallTest.test_call
PASS: test/test_call.py:CallTest.test_compound_call
PASS: test/test_call.py:CallTest.test_new_syntax
PASS: test/test_call.py:CallTest.test_ccall_caller
PASS: test/test_call.py:CallTest.test_stack_pop
PASS: test/test_call.py:CallTest.test_conditional_call
PASS: test/test_call.py:CallTest.test_chained_call
PASS: test/test_call.py:CallTest.test_nested_call
PASS: test/test_call.py:CallTest.test_nested_call_2
PASS: test/test_call.py:CallTest.test_nested_call_3
PASS: test/test_call.py:CallTest.test_nested_call_4
PASS: test/test_call.py:CallTest.test_chained_call_in_nested
PASS: test/test_call.py:CallTest.test_call_in_nested
PASS: test/test_call.py:CallTest.test_composed_def
PASS: test/test_call.py:CallTest.test_regular_defs
PASS: test/test_call.py:CallTest.test_call_in_nested_2
PASS: test/test_call.py:SelfCacheTest.test_basic
PASS: test/test_cmd.py:CmdTest.test_stdin_success
PASS: test/test_cmd.py:CmdTest.test_stdin_syntax_err
PASS: test/test_cmd.py:CmdTest.test_stdin_rt_err
PASS: test/test_cmd.py:CmdTest.test_file_success
PASS: test/test_cmd.py:CmdTest.test_file_syntax_err
PASS: test/test_cmd.py:CmdTest.test_file_rt_err
PASS: test/test_cmd.py:CmdTest.test_file_notfound
PASS: test/test_decorators.py:DecoratorTest.test_toplevel
PASS: test/test_decorators.py:DecoratorTest.test_toplevel_contextual
PASS: test/test_decorators.py:DecoratorTest.test_nested
PASS: test/test_decorators.py:DecoratorTest.test_toplevel_decorated_name
PASS: test/test_decorators.py:DecoratorTest.test_nested_decorated_name
PASS: test/test_def.py:DefTest.test_def_noargs
PASS: test/test_def.py:DefTest.test_def_blankargs
PASS: test/test_def.py:DefTest.test_def_args
PASS: test/test_def.py:DefTest.test_def_py3k_args
PASS: test/test_def.py:DefTest.test_inter_def
PASS: test/test_def.py:DefTest.test_toplevel
PASS: test/test_def.py:DefTest.test_def_operations
PASS: test/test_def.py:ScopeTest.test_scope_one
PASS: test/test_def.py:ScopeTest.test_scope_two
PASS: test/test_def.py:ScopeTest.test_scope_four
PASS: test/test_def.py:ScopeTest.test_scope_five
PASS: test/test_def.py:ScopeTest.test_scope_six
PASS: test/test_def.py:ScopeTest.test_scope_seven
PASS: test/test_def.py:ScopeTest.test_scope_eight
PASS: test/test_def.py:ScopeTest.test_scope_nine
PASS: test/test_def.py:ScopeTest.test_scope_ten
PASS: test/test_def.py:ScopeTest.test_scope_eleven
PASS: test/test_def.py:ScopeTest.test_unbound_scope
PASS: test/test_def.py:ScopeTest.test_unbound_scope_two
PASS: test/test_def.py:ScopeTest.test_canget_kwargs
PASS: test/test_def.py:ScopeTest.test_inline_expression_from_arg_one
PASS: test/test_def.py:ScopeTest.test_interpret_expression_from_arg_two
PASS: test/test_def.py:NestedDefTest.test_nested_def
PASS: test/test_def.py:NestedDefTest.test_nested_2
PASS: test/test_def.py:NestedDefTest.test_nested_with_args
PASS: test/test_def.py:NestedDefTest.test_nested_def_2
PASS: test/test_def.py:NestedDefTest.test_nested_nested_def
PASS: test/test_def.py:NestedDefTest.test_nested_nested_def_2
PASS: test/test_def.py:NestedDefTest.test_outer_scope
PASS: test/test_def.py:ExceptionTest.test_raise
PASS: test/test_def.py:ExceptionTest.test_handler
PASS: test/test_exceptions.py:ExceptionsTest.test_html_error_template
PASS: test/test_exceptions.py:ExceptionsTest.test_text_error_template
PASS: test/test_exceptions.py:ExceptionsTest.test_utf8_html_error_template_pygments
PASS: test/test_exceptions.py:ExceptionsTest.test_utf8_html_error_template_no_pygments
PASS: test/test_exceptions.py:ExceptionsTest.test_format_closures
PASS: test/test_exceptions.py:ExceptionsTest.test_py_utf8_html_error_template
PASS: test/test_exceptions.py:ExceptionsTest.test_py_unicode_error_html_error_template
PASS: test/test_exceptions.py:ExceptionsTest.test_format_exceptions_pygments
PASS: test/test_exceptions.py:ExceptionsTest.test_format_exceptions_no_pygments
PASS: test/test_exceptions.py:ExceptionsTest.test_utf8_format_exceptions_pygments
PASS: test/test_exceptions.py:ExceptionsTest.test_utf8_format_exceptions_no_pygments
PASS: test/test_exceptions.py:ExceptionsTest.test_mod_no_encoding
PASS: test/test_exceptions.py:ExceptionsTest.test_custom_tback
PASS: test/test_exceptions.py:ExceptionsTest.test_tback_no_trace_from_py_file
PASS: test/test_exceptions.py:ExceptionsTest.test_tback_trace_from_py_file
PASS: test/test_exceptions.py:ExceptionsTest.test_code_block_line_number
PASS: test/test_exceptions.py:ExceptionsTest.test_module_block_line_number
PASS: test/test_exceptions.py:ExceptionsTest.test_alternating_file_names
PASS: test/test_filters.py:FilterTest.test_basic
PASS: test/test_filters.py:FilterTest.test_expr
PASS: test/test_filters.py:FilterTest.test_convert_str
PASS: test/test_filters.py:FilterTest.test_quoting
PASS: test/test_filters.py:FilterTest.test_url_escaping
PASS: test/test_filters.py:FilterTest.test_entity
PASS: test/test_filters.py:FilterTest.test_def
PASS: test/test_filters.py:FilterTest.test_import
PASS: test/test_filters.py:FilterTest.test_import_2
PASS: test/test_filters.py:FilterTest.test_encode_filter
PASS: test/test_filters.py:FilterTest.test_encode_filter_non_str
PASS: test/test_filters.py:FilterTest.test_custom_default
PASS: test/test_filters.py:FilterTest.test_global
PASS: test/test_filters.py:FilterTest.test_block_via_context
PASS: test/test_filters.py:FilterTest.test_def_via_context
PASS: test/test_filters.py:FilterTest.test_text_via_context
PASS: test/test_filters.py:FilterTest.test_nflag
PASS: test/test_filters.py:FilterTest.test_global_json
PASS: test/test_filters.py:FilterTest.test_non_expression
PASS: test/test_filters.py:FilterTest.test_builtins
PASS: test/test_filters.py:BufferTest.test_buffered_def
PASS: test/test_filters.py:BufferTest.test_unbuffered_def
PASS: test/test_filters.py:BufferTest.test_capture
PASS: test/test_filters.py:BufferTest.test_capture_exception
PASS: test/test_filters.py:BufferTest.test_buffered_exception
PASS: test/test_filters.py:BufferTest.test_capture_ccall
PASS: test/test_inheritance.py:InheritanceTest.test_basic
PASS: test/test_inheritance.py:InheritanceTest.test_multilevel_nesting
PASS: test/test_inheritance.py:InheritanceTest.test_includes
PASS: test/test_inheritance.py:InheritanceTest.test_namespaces
PASS: test/test_inheritance.py:InheritanceTest.test_pageargs
PASS: test/test_inheritance.py:InheritanceTest.test_pageargs_2
PASS: test/test_inheritance.py:InheritanceTest.test_pageargs_err
PASS: test/test_inheritance.py:InheritanceTest.test_toplevel
PASS: test/test_inheritance.py:InheritanceTest.test_dynamic
PASS: test/test_inheritance.py:InheritanceTest.test_in_call
PASS: test/test_lexer.py:LexerTest.test_text_and_tag
PASS: test/test_lexer.py:LexerTest.test_unclosed_tag
PASS: test/test_lexer.py:LexerTest.test_onlyclosed_tag
PASS: test/test_lexer.py:LexerTest.test_noexpr_allowed
PASS: test/test_lexer.py:LexerTest.test_closing_tag_many_spaces
PASS: test/test_lexer.py:LexerTest.test_opening_tag_many_quotes
PASS: test/test_lexer.py:LexerTest.test_unmatched_tag
PASS: test/test_lexer.py:LexerTest.test_nonexistent_tag
PASS: test/test_lexer.py:LexerTest.test_wrongcase_tag
PASS: test/test_lexer.py:LexerTest.test_percent_escape
PASS: test/test_lexer.py:LexerTest.test_percent_escape2
PASS: test/test_lexer.py:LexerTest.test_percent_escape_with_control_block
PASS: test/test_lexer.py:LexerTest.test_inline_percent
PASS: test/test_lexer.py:LexerTest.test_old_multiline_comment
PASS: test/test_lexer.py:LexerTest.test_text_tag
PASS: test/test_lexer.py:LexerTest.test_def_syntax
PASS: test/test_lexer.py:LexerTest.test_def_syntax_2
PASS: test/test_lexer.py:LexerTest.test_whitespace_equals
PASS: test/test_lexer.py:LexerTest.test_ns_tag_closed
PASS: test/test_lexer.py:LexerTest.test_ns_tag_empty
PASS: test/test_lexer.py:LexerTest.test_ns_tag_open
PASS: test/test_lexer.py:LexerTest.test_expr_in_attribute
PASS: test/test_lexer.py:LexerTest.test_pagetag[,-48]
PASS: test/test_lexer.py:LexerTest.test_pagetag[-47]
PASS: test/test_lexer.py:LexerTest.test_nesting
PASS: test/test_lexer.py:LexerTest.test_code
PASS: test/test_lexer.py:LexerTest.test_code_and_tags
PASS: test/test_lexer.py:LexerTest.test_expression
PASS: test/test_lexer.py:LexerTest.test_tricky_expression
PASS: test/test_lexer.py:LexerTest.test_dict_expression_issue_400_regression
PASS: test/test_lexer.py:LexerTest.test_tricky_code
PASS: test/test_lexer.py:LexerTest.test_tricky_code_2
PASS: test/test_lexer.py:LexerTest.test_tricky_code_3
PASS: test/test_lexer.py:LexerTest.test_tricky_code_4
PASS: test/test_lexer.py:LexerTest.test_tricky_code_5
PASS: test/test_lexer.py:LexerTest.test_tricky_code_6
PASS: test/test_lexer.py:LexerTest.test_control_lines
PASS: test/test_lexer.py:LexerTest.test_control_lines_2
PASS: test/test_lexer.py:LexerTest.test_long_control_lines
PASS: test/test_lexer.py:LexerTest.test_unmatched_control
PASS: test/test_lexer.py:LexerTest.test_unmatched_control_2
PASS: test/test_lexer.py:LexerTest.test_unmatched_control_3
PASS: test/test_lexer.py:LexerTest.test_ternary_control
PASS: test/test_lexer.py:LexerTest.test_integration
PASS: test/test_lexer.py:LexerTest.test_comment_after_statement
PASS: test/test_lexer.py:LexerTest.test_crlf
PASS: test/test_lexer.py:LexerTest.test_comments
PASS: test/test_lexer.py:LexerTest.test_docs
PASS: test/test_lexer.py:LexerTest.test_preprocess
PASS: test/test_lookup.py:LookupTest.test_basic
PASS: test/test_lookup.py:LookupTest.test_subdir
PASS: test/test_lookup.py:LookupTest.test_updir
PASS: test/test_lookup.py:LookupTest.test_directory_lookup
PASS: test/test_lookup.py:LookupTest.test_no_lookup
PASS: test/test_lookup.py:LookupTest.test_uri_adjust
PASS: test/test_lookup.py:LookupTest.test_uri_cache
PASS: test/test_lookup.py:LookupTest.test_check_not_found
PASS: test/test_lookup.py:LookupTest.test_dont_accept_relative_outside_of_root
PASS: test/test_lookup.py:LookupTest.test_checking_against_bad_filetype
PASS: test/test_loop.py:TestLoop.test__FOR_LOOP
PASS: test/test_loop.py:TestLoop.test_loop_demo
PASS: test/test_loop.py:TestLoop.test_nested_loops
PASS: test/test_loop.py:TestLoop.test_no_loop
PASS: test/test_loop.py:TestLoop.test_out_of_context_access
PASS: test/test_loop.py:TestLoop.test_parent_loops
PASS: test/test_loop.py:TestLoopStack.test__pop
PASS: test/test_loop.py:TestLoopStack.test__push
PASS: test/test_loop.py:TestLoopStack.test__top
PASS: test/test_loop.py:TestLoopStack.test_enter
PASS: test/test_loop.py:TestLoopStack.test_exit
PASS: test/test_loop.py:TestLoopContext.test___len__
PASS: test/test_loop.py:TestLoopContext.test_cycle
PASS: test/test_loop.py:TestLoopContext.test_even
PASS: test/test_loop.py:TestLoopContext.test_first
PASS: test/test_loop.py:TestLoopContext.test_index
PASS: test/test_loop.py:TestLoopContext.test_last
PASS: test/test_loop.py:TestLoopContext.test_odd
PASS: test/test_loop.py:TestLoopContext.test_reverse_index
PASS: test/test_loop.py:TestLoopFlags.test_loop_disabled_template
PASS: test/test_loop.py:TestLoopFlags.test_loop_disabled_lookup
PASS: test/test_loop.py:TestLoopFlags.test_loop_disabled_override_template
PASS: test/test_loop.py:TestLoopFlags.test_loop_disabled_override_lookup
PASS: test/test_loop.py:TestLoopFlags.test_loop_enabled_override_template
PASS: test/test_loop.py:TestLoopFlags.test_loop_enabled_override_lookup
PASS: test/test_lru.py:LRUTest.testlru
PASS: test/test_namespace.py:NamespaceTest.test_inline_crossreference
PASS: test/test_namespace.py:NamespaceTest.test_inline_assignment
PASS: test/test_namespace.py:NamespaceTest.test_inline_arguments
PASS: test/test_namespace.py:NamespaceTest.test_inline_not_duped
PASS: test/test_namespace.py:NamespaceTest.test_dynamic
PASS: test/test_namespace.py:NamespaceTest.test_template
PASS: test/test_namespace.py:NamespaceTest.test_module
PASS: test/test_namespace.py:NamespaceTest.test_module_2
PASS: test/test_namespace.py:NamespaceTest.test_module_imports
PASS: test/test_namespace.py:NamespaceTest.test_module_imports_2
PASS: test/test_namespace.py:NamespaceTest.test_context
PASS: test/test_namespace.py:NamespaceTest.test_overload
PASS: test/test_namespace.py:NamespaceTest.test_getattr
PASS: test/test_namespace.py:NamespaceTest.test_in_def
PASS: test/test_namespace.py:NamespaceTest.test_in_remote_def
PASS: test/test_namespace.py:NamespaceTest.test_dont_pollute_self
PASS: test/test_namespace.py:NamespaceTest.test_inheritance
PASS: test/test_namespace.py:NamespaceTest.test_inheritance_two
PASS: test/test_namespace.py:NamespaceTest.test_attr
PASS: test/test_namespace.py:NamespaceTest.test_attr_raise
PASS: test/test_namespace.py:NamespaceTest.test_custom_tag_1
PASS: test/test_namespace.py:NamespaceTest.test_custom_tag_2
PASS: test/test_namespace.py:NamespaceTest.test_custom_tag_3
PASS: test/test_namespace.py:NamespaceTest.test_custom_tag_case_sensitive
PASS: test/test_namespace.py:NamespaceTest.test_expr_grouping
PASS: test/test_namespace.py:NamespaceTest.test_ccall
PASS: test/test_namespace.py:NamespaceTest.test_ccall_2
PASS: test/test_namespace.py:NamespaceTest.test_import
PASS: test/test_namespace.py:NamespaceTest.test_import_calledfromdef
PASS: test/test_namespace.py:NamespaceTest.test_closure_import
PASS: test/test_namespace.py:NamespaceTest.test_import_local
PASS: test/test_namespace.py:NamespaceTest.test_ccall_import
PASS: test/test_namespace.py:NamespaceTest.test_nonexistent_namespace_uri
PASS: test/test_pygen.py:GeneratePythonTest.test_generate_normal
PASS: test/test_pygen.py:GeneratePythonTest.test_generate_adjusted
PASS: test/test_pygen.py:GeneratePythonTest.test_generate_combo
PASS: test/test_pygen.py:GeneratePythonTest.test_multi_line
PASS: test/test_pygen.py:GeneratePythonTest.test_false_unindentor
PASS: test/test_pygen.py:GeneratePythonTest.test_backslash_line
PASS: test/test_pygen.py:WhitespaceTest.test_basic
PASS: test/test_pygen.py:WhitespaceTest.test_blank_lines
PASS: test/test_pygen.py:WhitespaceTest.test_open_quotes_with_pound
PASS: test/test_pygen.py:WhitespaceTest.test_quote_with_comments
PASS: test/test_pygen.py:WhitespaceTest.test_quotes_with_pound
PASS: test/test_pygen.py:WhitespaceTest.test_quotes
PASS: test/test_runtime.py:ContextTest.test_locals_kwargs
PASS: test/test_template.py:MiscTest.test_crlf_linebreaks
PASS: test/test_template.py:EncodingTest.test_escapes_html_tags
PASS: test/test_template.py:EncodingTest.test_unicode
PASS: test/test_template.py:EncodingTest.test_encoding_doesnt_conflict
PASS: test/test_template.py:EncodingTest.test_unicode_arg
PASS: test/test_template.py:EncodingTest.test_unicode_file
PASS: test/test_template.py:EncodingTest.test_unicode_file_code
PASS: test/test_template.py:EncodingTest.test_unicode_file_lookup
PASS: test/test_template.py:EncodingTest.test_unicode_bom
PASS: test/test_template.py:EncodingTest.test_unicode_memory
PASS: test/test_template.py:EncodingTest.test_unicode_text
PASS: test/test_template.py:EncodingTest.test_unicode_text_ccall
PASS: test/test_template.py:EncodingTest.test_unicode_literal_in_expr
PASS: test/test_template.py:EncodingTest.test_unicode_literal_in_expr_file
PASS: test/test_template.py:EncodingTest.test_unicode_literal_in_code
PASS: test/test_template.py:EncodingTest.test_unicode_literal_in_controlline
PASS: test/test_template.py:EncodingTest.test_unicode_literal_in_tag
PASS: test/test_template.py:EncodingTest.test_unicode_literal_in_def
PASS: test/test_template.py:EncodingTest.test_input_encoding
PASS: test/test_template.py:EncodingTest.test_encoding
PASS: test/test_template.py:EncodingTest.test_encoding_errors
PASS: test/test_template.py:EncodingTest.test_read_unicode
PASS: test/test_template.py:PageArgsTest.test_basic
PASS: test/test_template.py:PageArgsTest.test_inherits
PASS: test/test_template.py:PageArgsTest.test_includes
PASS: test/test_template.py:PageArgsTest.test_context_small
PASS: test/test_template.py:PageArgsTest.test_with_context
PASS: test/test_template.py:PageArgsTest.test_overrides_builtins
PASS: test/test_template.py:PageArgsTest.test_canuse_builtin_names
PASS: test/test_template.py:PageArgsTest.test_builtin_names_dont_clobber_defaults_in_includes
PASS: test/test_template.py:PageArgsTest.test_dict_locals
PASS: test/test_template.py:IncludeTest.test_basic
PASS: test/test_template.py:IncludeTest.test_localargs
PASS: test/test_template.py:IncludeTest.test_viakwargs
PASS: test/test_template.py:IncludeTest.test_include_withargs
PASS: test/test_template.py:IncludeTest.test_within_ccall
PASS: test/test_template.py:IncludeTest.test_include_error_handler
PASS: test/test_template.py:UndefinedVarsTest.test_undefined
PASS: test/test_template.py:UndefinedVarsTest.test_strict
PASS: test/test_template.py:UndefinedVarsTest.test_expression_declared
PASS: test/test_template.py:UndefinedVarsTest.test_list_comprehensions_plus_undeclared_nonstrict
PASS: test/test_template.py:UndefinedVarsTest.test_traditional_assignment_plus_undeclared
PASS: test/test_template.py:UndefinedVarsTest.test_list_comprehensions_plus_undeclared_strict
PASS: test/test_template.py:UndefinedVarsTest.test_dict_comprehensions_in_function_plus_undeclared_strict
PASS: test/test_template.py:StopRenderingTest.test_return_in_template
PASS: test/test_template.py:ReservedNameTest.test_names_on_context
PASS: test/test_template.py:ReservedNameTest.test_names_in_template
PASS: test/test_template.py:ReservedNameTest.test_exclude_loop_context
PASS: test/test_template.py:ReservedNameTest.test_exclude_loop_template
PASS: test/test_template.py:ControlTest.test_control
PASS: test/test_template.py:ControlTest.test_blank_control_1
PASS: test/test_template.py:ControlTest.test_blank_control_2
PASS: test/test_template.py:ControlTest.test_blank_control_3
PASS: test/test_template.py:ControlTest.test_blank_control_4
PASS: test/test_template.py:ControlTest.test_blank_control_5
PASS: test/test_template.py:ControlTest.test_blank_control_6
PASS: test/test_template.py:ControlTest.test_blank_control_7
PASS: test/test_template.py:ControlTest.test_blank_control_8
PASS: test/test_template.py:ControlTest.test_blank_control_9
PASS: test/test_template.py:ControlTest.test_blank_control_10
PASS: test/test_template.py:ControlTest.test_blank_control_11
PASS: test/test_template.py:ControlTest.test_commented_blank_control_1
PASS: test/test_template.py:ControlTest.test_commented_blank_control_2
PASS: test/test_template.py:ControlTest.test_commented_blank_control_3
PASS: test/test_template.py:ControlTest.test_commented_blank_control_4
PASS: test/test_template.py:ControlTest.test_commented_blank_control_5
PASS: test/test_template.py:ControlTest.test_commented_blank_control_6
PASS: test/test_template.py:ControlTest.test_commented_blank_control_7
PASS: test/test_template.py:ControlTest.test_commented_blank_control_8
PASS: test/test_template.py:ControlTest.test_commented_blank_control_9
PASS: test/test_template.py:ControlTest.test_commented_blank_control_10
PASS: test/test_template.py:ControlTest.test_multiline_control
PASS: test/test_template.py:GlobalsTest.test_globals
PASS: test/test_template.py:RichTracebackTest.test_utf8_memory_syntax
PASS: test/test_template.py:RichTracebackTest.test_utf8_memory_runtime
PASS: test/test_template.py:RichTracebackTest.test_utf8_file_syntax
PASS: test/test_template.py:RichTracebackTest.test_utf8_file_runtime
PASS: test/test_template.py:RichTracebackTest.test_unicode_memory_syntax
PASS: test/test_template.py:RichTracebackTest.test_unicode_memory_runtime
PASS: test/test_template.py:RichTracebackTest.test_unicode_file_syntax
PASS: test/test_template.py:RichTracebackTest.test_unicode_file_runtime
PASS: test/test_template.py:ModuleDirTest.test_basic
PASS: test/test_template.py:ModuleDirTest.test_callable
PASS: test/test_template.py:ModuleDirTest.test_custom_writer
PASS: test/test_template.py:FilenameToURITest.test_windows_paths
PASS: test/test_template.py:FilenameToURITest.test_posix_paths
PASS: test/test_template.py:FilenameToURITest.test_dont_accept_relative_outside_of_root
PASS: test/test_template.py:ModuleTemplateTest.test_module_roundtrip
PASS: test/test_template.py:TestTemplateAPI.test_metadata
PASS: test/test_template.py:TestTemplateAPI.test_metadata_two
PASS: test/test_template.py:PreprocessTest.test_old_comments
PASS: test/test_template.py:LexerTest.test_via_template
PASS: test/test_template.py:LexerTest.test_via_lookup
PASS: test/test_template.py:FuturesTest.test_future_import
PASS: test/test_template.py:EscapeTest.test_percent_escape
PASS: test/test_template.py:EscapeTest.test_percent_escape2
PASS: test/test_template.py:EscapeTest.test_inline_percent
PASS: test/test_template.py:EscapeTest.test_listcomp_in_func_strict
PASS: test/test_template.py:EscapeTest.test_setcomp_in_func_strict
PASS: test/test_template.py:EscapeTest.test_generator_in_func_strict
PASS: test/test_template.py:EscapeTest.test_dictcomp_in_func_strict
PASS: test/test_tgplugin.py:TestTGPlugin.test_basic
PASS: test/test_tgplugin.py:TestTGPlugin.test_subdir
PASS: test/test_tgplugin.py:TestTGPlugin.test_basic_dot
PASS: test/test_tgplugin.py:TestTGPlugin.test_subdir_dot
PASS: test/test_tgplugin.py:TestTGPlugin.test_string
PASS: test/test_tgplugin.py:TestTGPlugin.test_render
PASS: test/test_util.py:UtilTest.test_fast_buffer_write
PASS: test/test_util.py:UtilTest.test_fast_buffer_truncate
PASS: test/test_util.py:UtilTest.test_fast_buffer_encoded
PASS: test/test_util.py:UtilTest.test_read_file
PASS: test/test_util.py:UtilTest.test_load_module
PASS: test/test_util.py:UtilTest.test_load_plugin_failure
PASS: test/testing/test_config.py:BasicConfigTest.test_coercions
PASS: test/testing/test_config.py:BasicConfigTest.test_values
PASS: test/testing/test_config.py:BasicConfigTest.test_error_on_loading_from_nonexistent_file
PASS: test/testing/test_config.py:BasicConfigTest.test_error_on_loading_from_nonexistent_section
PASS: test/testing/test_config.py:BooleanConfigTest.test_values
PASS: test/testing/test_config.py:UnsupportedTypesConfigTest.test_values
PASS: test/testing/test_config.py:SupportedTypesConfigTest.test_values
PASS: test/testing/test_config.py:TypeMismatchConfigTest.test_error_on_load
PASS: test/testing/test_config.py:MissingItemConfigTest.test_error_on_load
============================================================================
Testsuite summary
DURATION: 40
END: /usr/lib/python3-mako/ptest
2024-06-16T19:21
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 .../python/python3-mako/run-ptest               |  3 +++
 .../python/python3-mako_1.3.5.bb                | 17 ++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-mako/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da6fa6ee97..d7d711383c 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -63,6 +63,7 @@ PTESTS_FAST = "\
     python3-jinja2 \
     python3-jsonpointer \
     python3-license-expression \
+    python3-mako \
     python3-markupsafe \
     python3-more-itertools \
     python3-pluggy \
diff --git a/meta/recipes-devtools/python/python3-mako/run-ptest b/meta/recipes-devtools/python/python3-mako/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-mako/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.5.bb b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
index d27fb121a6..d52f72f458 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.5.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.5.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d0995d6f7ba3f186a03118f244e88f57"
 
 PYPI_PACKAGE = "Mako"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest
+
+SRC_URI:append = " \
+    file://run-ptest \
+"
 
 SRC_URI[sha256sum] = "48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc"
 
@@ -17,4 +21,15 @@ RDEPENDS:${PN} = "python3-html \
                   python3-threading \
 "
 
+RDEPENDS:${PN}-ptest += "\
+    python3-pytest \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    install -m 0644 ${S}/setup.cfg ${D}${PTEST_PATH}/
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


